namespace py order_service
namespace java order_service

// Order status enumeration
enum OrderStatus {
    PENDING = 1,
    CONFIRMED = 2,
    SHIPPED = 3,
    DELIVERED = 4,
    CANCELLED = 5
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
    6: string createdAt,
    7: string updatedAt
}

// Service exceptions
exception OrderNotFoundException {
    1: string message
}

exception InvalidOrderException {
    1: string message
}

// Order processing service
service OrderProcessor {
    // Create a new order
    string createOrder(1: Order order) throws (1: InvalidOrderException ex),
    
    // Get order by ID
    Order getOrder(1: string orderId) throws (1: OrderNotFoundException ex),
    
    // Update order status
    bool updateOrderStatus(1: string orderId, 2: OrderStatus status) throws (1: OrderNotFoundException ex),
    
    // Cancel an order
    bool cancelOrder(1: string orderId) throws (1: OrderNotFoundException ex),
    
    // Get all orders for a customer
    list<Order> getOrdersByCustomer(1: string customerId)
}