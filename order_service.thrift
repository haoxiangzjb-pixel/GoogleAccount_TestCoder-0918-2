namespace py orderservice
namespace java orderservice

// Определение типа для элемента заказа
struct OrderItem {
    1: i32 product_id,
    2: string name,
    3: i32 quantity,
    4: double price
}

// Определение типа для адреса
struct Address {
    1: string street,
    2: string city,
    3: string state,
    4: string zip_code
}

// Определение типа для заказа
struct Order {
    1: i32 order_id,
    2: list<OrderItem> items,
    3: Address shipping_address,
    4: double total_amount,
    5: string status = "PENDING" // Статус по умолчанию
}

// Исключение для ошибок валидации
exception ValidationException {
    1: string message
}

// Сервис для обработки заказов
service OrderService {
    // Создать новый заказ
    Order create_order(1: list<OrderItem> items, 2: Address shipping_address) throws (1: ValidationException validation_error),

    // Получить информацию о заказе по ID
    Order get_order(1: i32 order_id) throws (1: ValidationException validation_error),

    // Обновить статус заказа
    void update_order_status(1: i32 order_id, 2: string status) throws (1: ValidationException validation_error),

    // Рассчитать общую сумму заказа
    double calculate_total(1: list<OrderItem> items) throws (1: ValidationException validation_error)
}