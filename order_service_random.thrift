namespace java com.example.order

// Определение типа для статуса заказа
enum OrderStatus {
  PENDING = 1,
  CONFIRMED = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5
}

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customerName,
  3: string product,
  4: i32 quantity,
  5: double price,
  6: OrderStatus status
}

// Определение сервиса для обработки заказов
service OrderService {
  // Создать новый заказ
  i64 createOrder(1: Order order),

  // Получить заказ по ID
  Order getOrder(1: i64 orderId),

  // Обновить статус заказа
  bool updateOrderStatus(1: i64 orderId, 2: OrderStatus newStatus),

  // Отменить заказ
  bool cancelOrder(1: i64 orderId)
}