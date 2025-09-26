namespace py order_service
namespace java order_service

// Типы данных
struct OrderItem {
  1: i32 productId,
  2: i32 quantity,
  3: double price
}

struct Address {
  1: string street,
  2: string city,
  3: string state,
  4: string zipCode
}

struct Order {
  1: i32 id,
  2: list<OrderItem> items,
  3: Address shippingAddress,
  4: double totalAmount,
  5: string status,
  6: string createdAt
}

exception OrderNotFoundException {
  1: string message
}

// Сервис
service OrderService {
  // Создать новый заказ
  i32 createOrder(1: list<OrderItem> items, 2: Address shippingAddress) throws (1: OrderNotFoundException notFound);

  // Получить информацию о заказе по ID
  Order getOrder(1: i32 orderId) throws (1: OrderNotFoundException notFound);

  // Обновить статус заказа
  void updateOrderStatus(1: i32 orderId, 2: string newStatus) throws (1: OrderNotFoundException notFound);

  // Отменить заказ
  void cancelOrder(1: i32 orderId) throws (1: OrderNotFoundException notFound);
}