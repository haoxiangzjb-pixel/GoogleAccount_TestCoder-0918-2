namespace py gen

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customer_name,
  3: string product,
  4: i32 quantity,
  5: double price,
}

// Определение исключения для ошибок
exception OrderException {
  1: string message,
}

// Определение сервиса
service OrderService {
  // Метод для создания заказа
  bool createOrder(1: Order order) throws (1: OrderException ex),

  // Метод для получения заказа по ID
  Order getOrder(1: i64 id) throws (1: OrderException ex),

  // Метод для обновления статуса заказа (для простоты, просто строка)
  bool updateOrderStatus(1: i64 id, 2: string status) throws (1: OrderException ex),
}