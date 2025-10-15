namespace java com.example.orderservice
namespace cpp order_service
namespace py order_service

// Define the status of an order
enum OrderStatus {
    PENDING = 1,
    CONFIRMED = 2,
    PROCESSING = 3,
    SHIPPED = 4,
    DELIVERED = 5,
    CANCELLED = 6
}

// Define the order item structure
struct OrderItem {
    1: required i64 productId,
    2: required string productName,
    3: required i32 quantity,
    4: required double price
}

// Define the main order structure
struct Order {
    1: required i64 orderId,
    2: required i64 customerId,
    3: required list<OrderItem> items,
    4: required double totalAmount,
    5: required OrderStatus status,
    6: required string createdAt,
    7: optional string updatedAt,
    8: optional string shippingAddress
}

// Define the exception for when an order is not found
exception OrderNotFoundException {
    1: string message
}

// Define the exception for invalid input
exception InvalidInputException {
    1: string message
}

// Define the main service interface
service OrderService {
    // Create a new order
    Order createOrder(1: Order order) throws (1: InvalidInputException e),

    // Get an order by ID
    Order getOrder(1: i64 orderId) throws (1: OrderNotFoundException e),

    // Update an existing order
    Order updateOrder(1: Order order) throws (1: OrderNotFoundException e, 2: InvalidInputException e),

    // Delete an order by ID
    void deleteOrder(1: i64 orderId) throws (1: OrderNotFoundException e),

    // Get all orders for a specific customer
    list<Order> getOrdersByCustomer(1: i64 customerId),

    // Update the status of an order
    Order updateOrderStatus(1: i64 orderId, 2: OrderStatus status) throws (1: OrderNotFoundException e),

    // Get all orders with a specific status
    list<Order> getOrdersByStatus(1: OrderStatus status)
}