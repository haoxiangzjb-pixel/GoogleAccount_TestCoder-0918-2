namespace java com.example.order

// Типы ошибок
enum OrderErrorCode {
    UNKNOWN_ERROR = 0,
    INVALID_INPUT = 1,
    PAYMENT_FAILED = 2,
    INSUFFICIENT_STOCK = 3
}

// Структура ошибки
struct OrderError {
    1: required OrderErrorCode code,
    2: required string message
}

// Типы статуса заказа
enum OrderStatus {
    PENDING = 0,
    CONFIRMED = 1,
    SHIPPED = 2,
    DELIVERED = 3,
    CANCELLED = 4
}

// Структура товара в заказе
struct Item {
    1: required i64 id,
    2: required string name,
    3: required i32 quantity,
    4: required double price
}

// Структура заказа
struct Order {
    1: required i64 id,
    2: required list<Item> items,
    3: required double total_amount,
    4: required OrderStatus status,
    5: required string customer_email
}

// Аргументы для метода placeOrder
struct PlaceOrderRequest {
    1: required list<Item> items,
    2: required string customer_email
}

// Ответ для метода placeOrder
struct PlaceOrderResponse {
    1: optional Order order,
    2: optional OrderError error
}

// Аргументы для метода getOrder
struct GetOrderRequest {
    1: required i64 order_id
}

// Ответ для метода getOrder
struct GetOrderResponse {
    1: optional Order order,
    2: optional OrderError error
}

// Основной сервис
service OrderService {
    PlaceOrderResponse placeOrder(1: PlaceOrderRequest request),
    GetOrderResponse getOrder(1: GetOrderRequest request)
}