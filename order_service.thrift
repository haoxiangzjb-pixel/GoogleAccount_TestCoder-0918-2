namespace py order_service

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customer_name,
  3: list<string> items,
  4: double total_amount,
  5: string status
}

// Определение исключения
exception OrderNotFoundException {
  1: string message
}

// Определение сервиса
service OrderService {
  // Создать новый заказ
  Order createOrder(1: Order order),

  // Получить заказ по ID
  Order getOrder(1: i64 id) throws (1: OrderNotFoundException e),

  // Обновить статус заказа
  void updateOrderStatus(1: i64 id, 2: string status) throws (1: OrderNotFoundException e),

  // Получить все заказы
  list<Order> getAllOrders()
}