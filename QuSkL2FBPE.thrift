namespace java com.example.order
namespace py order_service
namespace cpp order_service

// Enum for order status
enum OrderStatus {
  PENDING = 0,
  CONFIRMED = 1,
  PROCESSING = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5
}

// Structure for an order item
struct OrderItem {
  1: required i32 productId,
  2: required string productName,
  3: required i32 quantity,
  4: required double price
}

// Structure for an order
struct Order {
  1: required i64 orderId,
  2: required i64 userId,
  3: required list<OrderItem> items,
  4: required double totalAmount,
  5: required OrderStatus status,
  6: required string address,
  7: optional string notes,
  8: required i64 createdAt,
  9: optional i64 updatedAt
}

// Structure for order creation request
struct CreateOrderRequest {
  1: required i64 userId,
  2: required list<OrderItem> items,
  3: required string address,
  4: optional string notes
}

// Structure for order response
struct OrderResponse {
  1: required bool success,
  2: optional Order order,
  3: optional string errorMessage
}

// Exception for order-related errors
exception OrderException {
  1: required string message,
  2: optional i32 errorCode
}

// Main service definition
service OrderService {
  // Create a new order
  OrderResponse createOrder(1: CreateOrderRequest request) throws (1: OrderException ex),
  
  // Get order by ID
  OrderResponse getOrder(1: i64 orderId) throws (1: OrderException ex),
  
  // Update order status
  bool updateOrderStatus(1: i64 orderId, 2: OrderStatus status) throws (1: OrderException ex),
  
  // Cancel an order
  bool cancelOrder(1: i64 orderId) throws (1: OrderException ex),
  
  // Get all orders for a user
  list<Order> getUserOrders(1: i64 userId) throws (1: OrderException ex),
  
  // Get all orders (admin function)
  list<Order> getAllOrders() throws (1: OrderException ex)
}