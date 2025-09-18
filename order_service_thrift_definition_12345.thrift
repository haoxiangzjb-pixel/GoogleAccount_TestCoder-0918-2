namespace java com.example.orderservice
namespace py order_service

// Статус заказа
enum OrderStatus {
  CREATED = 1,
  PAID = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5
}

// Элемент заказа
struct OrderItem {
  1: string productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

// Заказ
struct Order {
  1: string orderId,
  2: string customerId,
  3: list<OrderItem> items,
  4: double totalAmount,
  5: OrderStatus status,
  6: i64 createdAt,
  7: i64 updatedAt
}

// Запрос на создание заказа
struct CreateOrderRequest {
  1: string customerId,
  2: list<OrderItem> items
}

// Ответ на создание заказа
struct CreateOrderResponse {
  1: bool success,
  2: string orderId,
  3: string message
}

// Запрос на получение заказа
struct GetOrderRequest {
  1: string orderId
}

// Запрос на обновление статуса заказа
struct UpdateOrderStatusRequest {
  1: string orderId,
  2: OrderStatus newStatus
}

// Ответ на обновление статуса заказа
struct UpdateOrderStatusResponse {
  1: bool success,
  2: string message
}

// Исключение для заказа
exception OrderException {
  1: string message,
  2: string errorCode
}

// Сервис обработки заказов
service OrderService {
  CreateOrderResponse createOrder(1: CreateOrderRequest request) throws (1: OrderException ex),
  Order getOrder(1: GetOrderRequest request) throws (1: OrderException ex),
  UpdateOrderStatusResponse updateOrderStatus(1: UpdateOrderStatusRequest request) throws (1: OrderException ex),
  list<Order> listOrdersByCustomer(1: string customerId) throws (1: OrderException ex)
}