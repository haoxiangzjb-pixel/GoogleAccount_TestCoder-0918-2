# Order Processing Service

This is a Thrift-based service for processing orders. It includes definitions for orders, order items, and operations that can be performed on orders.

## Files

- `order_service.thrift`: The Thrift definition file that defines the data structures and service interface
- `gen-py/`: Python code generated from the Thrift definition
- `gen-java/`: Java code generated from the Thrift definition
- `order_service_impl.py`: A sample implementation of the order processing service in Python
- `order_service_client.py`: A sample client to test the service

## Prerequisites

- Thrift compiler
- Python with Thrift library

## Generating Code

If you need to regenerate the code from the Thrift definition:

```bash
# For Python
thrift --gen py -out ./gen-py order_service.thrift

# For Java
thrift --gen java -out ./gen-java order_service.thrift
```

## Running the Service

1. Start the service:
   ```bash
   python order_service_impl.py
   ```

2. In another terminal, run the client to test:
   ```bash
   python order_service_client.py
   ```

## Service Operations

- `createOrder`: Creates a new order
- `getOrder`: Retrieves an order by its ID
- `updateOrderStatus`: Updates the status of an order
- `cancelOrder`: Cancels an order
- `getOrdersByCustomer`: Retrieves all orders for a specific customer

## Data Structures

- `Order`: Represents an order with ID, customer ID, items, total amount, status, and shipping address
- `OrderItem`: Represents an item in an order with product ID, name, quantity, and price
- `OrderStatus`: Enumeration of possible order statuses (PENDING, CONFIRMED, PROCESSING, SHIPPED, DELIVERED, CANCELLED)
- `OrderResponse`: Standard response structure with success flag, message, and order data