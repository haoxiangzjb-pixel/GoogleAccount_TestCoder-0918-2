namespace java com.example.orderservice
namespace py order_service
namespace cpp order_service

// Define an Order data structure
struct Order {
  1: i64 id,
  2: string customerName,
  3: string customerEmail,
  4: list<OrderItem> items,
  5: double totalAmount,
  6: string status,
  7: i64 createdAt,
  8: optional string shippingAddress
}

// Define an OrderItem data structure
struct OrderItem {
  1: i64 productId,
  2: string productName,
  3: i32 quantity,
  4: double unitPrice
}

// Define possible exceptions
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
  Order updateOrder(1: Order order) throws (1: OrderNotFoundException e, 2: InvalidOrderException e),
  
  // Cancel an order
  bool cancelOrder(1: i64 orderId) throws (1: OrderNotFoundException e),
  
  // List all orders for a customer
  list<Order> getOrdersByCustomer(1: string customerEmail),
  
  // Change order status
  bool updateOrderStatus(1: i64 orderId, 2: string newStatus) throws (1: OrderNotFoundException e)
}