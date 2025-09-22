namespace java com.example.order
namespace py order_service

// Order status enumeration
enum OrderStatus {
  PENDING = 1,
  CONFIRMED = 2,
  PROCESSING = 3,
  SHIPPED = 4,
  DELIVERED = 5,
  CANCELLED = 6
}

// Order item structure
struct OrderItem {
  1: string productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

// Order structure
struct Order {
  1: string orderId,
  2: string customerId,
  3: list<OrderItem> items,
  4: double totalAmount,
  5: OrderStatus status,
  6: string shippingAddress,
  7: string createdAt
}

// Response structure
struct OrderResponse {
  1: bool success,
  2: string message,
  3: Order order
}

// Order processing service
service OrderProcessingService {
  // Create a new order
  OrderResponse createOrder(1: Order order),
  
  // Get order by ID
  OrderResponse getOrder(1: string orderId),
  
  // Update order status
  OrderResponse updateOrderStatus(1: string orderId, 2: OrderStatus status),
  
  // Cancel an order
  OrderResponse cancelOrder(1: string orderId),
  
  // Get all orders for a customer
  list<Order> getOrdersByCustomer(1: string customerId)
}