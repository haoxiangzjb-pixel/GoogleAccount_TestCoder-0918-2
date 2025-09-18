#!/usr/bin/env python3

import sys
import glob
sys.path.append('gen-py')

from order_service import OrderProcessor
from order_service.ttypes import *
from order_service.constants import *

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

import logging
import uuid
from datetime import datetime

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class OrderHandler:
    def __init__(self):
        self.orders = {}  # In-memory storage for orders
        
    def createOrder(self, order):
        """
        Create a new order
        """
        logger.info(f"Creating order for customer {order.customerId}")
        
        # Validate order
        if not order.customerId or not order.items:
            raise InvalidOrderException("Order must have a customer ID and items")
            
        # Generate order ID if not provided
        if not order.orderId:
            order.orderId = str(uuid.uuid4())
            
        # Set timestamps
        now = datetime.now().isoformat()
        if not order.createdAt:
            order.createdAt = now
        order.updatedAt = now
        
        # Calculate total amount
        if order.totalAmount == 0.0:
            order.totalAmount = sum(item.price * item.quantity for item in order.items)
            
        # Set initial status
        if not order.status:
            order.status = OrderStatus.PENDING
            
        # Store order
        self.orders[order.orderId] = order
        
        logger.info(f"Order {order.orderId} created successfully")
        return order.orderId
        
    def getOrder(self, orderId):
        """
        Get order by ID
        """
        logger.info(f"Retrieving order {orderId}")
        
        if orderId not in self.orders:
            raise OrderNotFoundException(f"Order {orderId} not found")
            
        return self.orders[orderId]
        
    def updateOrderStatus(self, orderId, status):
        """
        Update order status
        """
        logger.info(f"Updating status of order {orderId} to {status}")
        
        if orderId not in self.orders:
            raise OrderNotFoundException(f"Order {orderId} not found")
            
        self.orders[orderId].status = status
        self.orders[orderId].updatedAt = datetime.now().isoformat()
        
        return True
        
    def cancelOrder(self, orderId):
        """
        Cancel an order
        """
        logger.info(f"Cancelling order {orderId}")
        
        if orderId not in self.orders:
            raise OrderNotFoundException(f"Order {orderId} not found")
            
        self.orders[orderId].status = OrderStatus.CANCELLED
        self.orders[orderId].updatedAt = datetime.now().isoformat()
        
        return True
        
    def getOrdersByCustomer(self, customerId):
        """
        Get all orders for a customer
        """
        logger.info(f"Retrieving orders for customer {customerId}")
        
        customer_orders = [
            order for order in self.orders.values() 
            if order.customerId == customerId
        ]
        
        return customer_orders

if __name__ == '__main__':
    handler = OrderHandler()
    processor = OrderProcessor.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()
    
    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    
    logger.info("Starting Order Service server on port 9090...")
    server.serve()