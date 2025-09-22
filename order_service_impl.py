"""
Order Processing Service Implementation
This is a simple implementation of the Thrift service for processing orders.
"""

import sys
import uuid
from datetime import datetime
from thrift.transport import TSocket, TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

# Add the generated code to the path
sys.path.append('/workspace/gen-py')

from order_service import OrderProcessingService
from order_service.ttypes import *

class OrderProcessingHandler:
    def __init__(self):
        self.orders = {}  # In-memory storage for orders

    def createOrder(self, order):
        # Generate a unique order ID if not provided
        if not order.orderId:
            order.orderId = str(uuid.uuid4())
        
        # Set creation time
        order.createdAt = datetime.now().isoformat()
        
        # Calculate total amount if not provided
        if order.totalAmount == 0.0:
            order.totalAmount = sum(item.price * item.quantity for item in order.items)
        
        # Set initial status
        if order.status == OrderStatus.UNKNOWN_TO_SDK_VERSION:
            order.status = OrderStatus.PENDING
        
        # Store the order
        self.orders[order.orderId] = order
        
        # Return response
        return OrderResponse(
            success=True,
            message=f"Order {order.orderId} created successfully",
            order=order
        )

    def getOrder(self, orderId):
        if orderId in self.orders:
            return OrderResponse(
                success=True,
                message="Order found",
                order=self.orders[orderId]
            )
        else:
            return OrderResponse(
                success=False,
                message=f"Order {orderId} not found",
                order=None
            )

    def updateOrderStatus(self, orderId, status):
        if orderId in self.orders:
            self.orders[orderId].status = status
            return OrderResponse(
                success=True,
                message=f"Order {orderId} status updated to {OrderStatus._VALUES_TO_NAMES[status]}",
                order=self.orders[orderId]
            )
        else:
            return OrderResponse(
                success=False,
                message=f"Order {orderId} not found",
                order=None
            )

    def cancelOrder(self, orderId):
        if orderId in self.orders:
            self.orders[orderId].status = OrderStatus.CANCELLED
            return OrderResponse(
                success=True,
                message=f"Order {orderId} cancelled",
                order=self.orders[orderId]
            )
        else:
            return OrderResponse(
                success=False,
                message=f"Order {orderId} not found",
                order=None
            )

    def getOrdersByCustomer(self, customerId):
        customer_orders = [order for order in self.orders.values() if order.customerId == customerId]
        return customer_orders

if __name__ == '__main__':
    handler = OrderProcessingHandler()
    processor = OrderProcessingService.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()
    
    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    
    print("Starting Order Processing Service on port 9090...")
    server.serve()