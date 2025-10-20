// Order Processing Service Definition in Thrift

namespace java com.example.orders
namespace py order_service
namespace cpp order_service

// Define an Order structure
struct Order {
  1: i64 id,
  2: string customerName,
  3: string customerEmail,
  4: list<OrderItem> items,
  5: double totalAmount,
  6: string status,
  7: i64 createdAt,
  8: i64 updatedAt
}

// Define an OrderItem structure
struct OrderItem {
  1: i64 productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

// Define exceptions
exception OrderNotFoundException {
  1: string message
}

exception InvalidOrderException {
  1: string message
}

// Define the OrderService
service OrderService {
  // Create a new order
  Order createOrder(1: Order order) throws (1: InvalidOrderException e),
  
  // Get an order by ID
  Order getOrder(1: i64 orderId) throws (1: OrderNotFoundException e),
  
  // Update an existing order
  Order updateOrder(1: i64 orderId, 2: Order order) throws (1: OrderNotFoundException e, 2: InvalidOrderException e),
  
  // Delete an order
  bool deleteOrder(1: i64 orderId) throws (1: OrderNotFoundException e),
  
  // List all orders (with optional limit and offset)
  list<Order> listOrders(1: i32 limit = 10, 2: i32 offset = 0),
  
  // Change order status
  bool updateOrderStatus(1: i64 orderId, 2: string status) throws (1: OrderNotFoundException e),
  
  // Calculate total for an order
  double calculateOrderTotal(1: Order order)
}