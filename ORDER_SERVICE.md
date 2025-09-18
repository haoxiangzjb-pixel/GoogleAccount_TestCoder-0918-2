# Order Processing Service (Thrift)

This is a Thrift-based service for processing orders. It provides functionality to create, retrieve, update, and cancel orders.

## Service Definition

The service is defined in `order_service.thrift` with the following components:

### Data Structures

- `OrderStatus`: Enumeration of order statuses (PENDING, CONFIRMED, SHIPPED, DELIVERED, CANCELLED)
- `OrderItem`: Represents an item in an order (product ID, name, quantity, price)
- `Order`: Represents an order (order ID, customer ID, items, total amount, status, timestamps)

### Exceptions

- `OrderNotFoundException`: Thrown when an order is not found
- `InvalidOrderException`: Thrown when an order is invalid

### Service Methods

- `createOrder`: Creates a new order
- `getOrder`: Retrieves an order by ID
- `updateOrderStatus`: Updates the status of an order
- `cancelOrder`: Cancels an order
- `getOrdersByCustomer`: Retrieves all orders for a customer

## Generated Code

The Python code was generated using:
```
thrift -r --gen py order_service.thrift
```

This creates the necessary classes and service interfaces in the `gen-py` directory.

## Implementation

- `order_server.py`: Implementation of the service server
- `order_client.py`: Example client that demonstrates using the service

## Running the Service

1. Start the server:
   ```
   python3 order_server.py
   ```

2. In another terminal, run the client:
   ```
   python3 order_client.py
   ```

The client demonstrates creating an order, retrieving it, updating its status, and cancelling it.