namespace py order_service

// Структура заказа
struct Order {
  1: i32 id,
  2: string customer_name,
  3: list<string> items,
  4: double total_amount,
  5: string status,
  6: string created_at
}

// Структура для создания нового заказа
struct NewOrder {
  1: string customer_name,
  2: list<string> items,
  3: double total_amount
}

// Исключение для случая, когда заказ не найден
exception OrderNotFoundException {
  1: string message
}

// Сервис для обработки заказов
service OrderService {
  // Создание нового заказа
  i32 createOrder(1: NewOrder order),
  
  // Получение заказа по ID
  Order getOrder(1: i32 orderId) throws (1: OrderNotFoundException ex),
  
  // Получение всех заказов
  list<Order> getAllOrders(),
  
  // Обновление статуса заказа
  bool updateOrderStatus(1: i32 orderId, 2: string status) throws (1: OrderNotFoundException ex),
  
  // Удаление заказа
  bool deleteOrder(1: i32 orderId) throws (1: OrderNotFoundException ex)
}