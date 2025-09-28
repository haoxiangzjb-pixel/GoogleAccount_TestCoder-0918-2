// Определение структур и сервиса для обработки заказов

// Структура для товара в заказе
struct Product {
  1: i32 id,
  2: string name,
  3: double price
}

// Структура для заказа
struct Order {
  1: i64 order_id,
  2: list<Product> items,
  3: double total_amount,
  4: string status
}

// Исключение для ошибок
exception OrderNotFound {
  1: string message
}

// Сервис для обработки заказов
service OrderService {
  // Создать новый заказ
  i64 createOrder(1: list<Product> items) throws (1: OrderNotFound notFound),

  // Получить информацию о заказе по ID
  Order getOrder(1: i64 order_id) throws (1: OrderNotFound notFound)
}