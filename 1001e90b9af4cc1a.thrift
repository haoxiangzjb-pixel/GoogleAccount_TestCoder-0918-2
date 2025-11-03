namespace java com.example.orderservice
namespace py order_service
namespace cpp order_service

// Enum for order status
enum OrderStatus {
    PENDING = 1,
    CONFIRMED = 2,
    PROCESSING = 3,
    SHIPPED = 4,
    DELIVERED = 5,
    CANCELLED = 6
}

// Struct for order items
struct OrderItem {
    1: i32 productId,
    2: string productName,
    3: i32 quantity,
    4: double price
}

// Struct for order
struct Order {
    1: i64 orderId,
    2: i64 userId,
    3: list<OrderItem> items,
    4: double totalAmount,
    5: OrderStatus status,
    6: string createdAt,
    7: string updatedAt
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
    bool updateOrderStatus(1: i64 orderId, 2: OrderStatus status) throws (1: OrderNotFoundException e),
    
    // Get all orders for a user
    list<Order> getOrdersByUser(1: i64 userId),
    
    // Cancel an order
    bool cancelOrder(1: i64 orderId) throws (1: OrderNotFoundException e),
    
    // Get total count of orders
    i32 getOrderCount()
}