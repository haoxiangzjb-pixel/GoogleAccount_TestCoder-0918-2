namespace java com.example.order
namespace py order_service
namespace cpp order_service

// Order status enumeration
enum OrderStatus {
  PENDING = 1,
  CONFIRMED = 2,
  PROCESSING = 3,
  SHIPPED = 4,
  DELIVERED = 5,
  CANCELLED = 6
}

// Product structure
struct Product {
  1: i32 id,
  2: string name,
  3: double price,
  4: i32 quantity
}

// Address structure
struct Address {
  1: string street,
  2: string city,
  3: string state,
  4: string zipCode,
  5: string country
}

// Order structure
struct Order {
  1: i64 id,
  2: list<Product> products,
  3: Address shippingAddress,
  4: double totalAmount,
  5: string customerEmail,
  6: OrderStatus status,
  7: i64 createdAt,
  8: i64 updatedAt
}

// Exception for order not found
exception OrderNotFoundException {
  1: string message
}

// Exception for invalid order
exception InvalidOrderException {
  1: string message
}

// Main service definition
service OrderService {
  // Create a new order
  i64 createOrder(1: Order order) throws (1: InvalidOrderException e),
  
  // Get order by ID
  Order getOrder(1: i64 orderId) throws (1: OrderNotFoundException e),
  
  // Update order status
  void updateOrderStatus(1: i64 orderId, 2: OrderStatus newStatus) throws (1: OrderNotFoundException e),
  
  // Cancel order
  void cancelOrder(1: i64 orderId) throws (1: OrderNotFoundException e),
  
  // List orders for a customer
  list<Order> getOrdersByCustomer(1: string customerEmail),
  
  // Get all orders
  list<Order> getAllOrders(),
  
  // Calculate total for an order
  double calculateOrderTotal(1: Order order)
}