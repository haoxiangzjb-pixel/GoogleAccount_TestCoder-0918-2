#!/usr/bin/env python3

import sys
sys.path.append('gen-py')

from order_service import OrderProcessor
from order_service.ttypes import *
from order_service.constants import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

import uuid

def main():
    # Create a socket to connect to the server
    transport = TSocket.TSocket('localhost', 9090)
    
    # Buffer the transport
    transport = TTransport.TBufferedTransport(transport)
    
    # Wrap in a protocol
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    
    # Create a client to use the protocol encoder
    client = OrderProcessor.Client(protocol)
    
    try:
        # Connect to the server
        transport.open()
        
        # Create an order item
        item1 = OrderItem(
            productId="12345",
            productName="Laptop",
            quantity=1,
            price=1200.00
        )
        
        item2 = OrderItem(
            productId="67890",
            productName="Mouse",
            quantity=2,
            price=25.00
        )
        
        # Create an order
        order = Order(
            customerId="customer-123",
            items=[item1, item2],
            totalAmount=0.0,  # Will be calculated by server
            status=OrderStatus.PENDING
        )
        
        print("Creating order...")
        order_id = client.createOrder(order)
        print(f"Order created with ID: {order_id}")
        
        # Retrieve the order
        print("\nRetrieving order...")
        retrieved_order = client.getOrder(order_id)
        print(f"Retrieved order: {retrieved_order}")
        
        # Update order status
        print("\nUpdating order status to CONFIRMED...")
        result = client.updateOrderStatus(order_id, OrderStatus.CONFIRMED)
        print(f"Update result: {result}")
        
        # Retrieve updated order
        print("\nRetrieving updated order...")
        updated_order = client.getOrder(order_id)
        print(f"Updated order status: {OrderStatus._VALUES_TO_NAMES[updated_order.status]}")
        
        # Get all orders for customer
        print("\nGetting all orders for customer...")
        customer_orders = client.getOrdersByCustomer("customer-123")
        print(f"Found {len(customer_orders)} orders for customer")
        for o in customer_orders:
            print(f"  Order ID: {o.orderId}, Status: {OrderStatus._VALUES_TO_NAMES[o.status]}, Total: ${o.totalAmount}")
            
        # Cancel order
        print("\nCancelling order...")
        cancel_result = client.cancelOrder(order_id)
        print(f"Cancel result: {cancel_result}")
        
        # Retrieve cancelled order
        print("\nRetrieving cancelled order...")
        cancelled_order = client.getOrder(order_id)
        print(f"Cancelled order status: {OrderStatus._VALUES_TO_NAMES[cancelled_order.status]}")
        
        # Try to get a non-existent order (exception handling)
        print("\nTrying to get a non-existent order...")
        try:
            client.getOrder("non-existent-id")
        except OrderNotFoundException as e:
            print(f"Caught expected exception: {e.message}")
            
    except Thrift.TException as tx:
        print(f"Thrift exception: {tx.message}")
        
    finally:
        # Close the transport
        transport.close()

if __name__ == '__main__':
    main()