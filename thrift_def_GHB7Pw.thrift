namespace py orderservice
namespace java com.example.orderservice

// Определение статуса заказа
enum OrderStatus {
    PENDING = 0,
    CONFIRMED = 1,
    SHIPPED = 2,
    DELIVERED = 3,
    CANCELLED = 4
}

// Определение структуры заказа
struct Order {
    1: i64 id,
    2: string customer_name,
    3: string product,
    4: i32 quantity,
    5: double total_price,
    6: OrderStatus status,
    7: string created_at
}

// Определение исключения
exception OrderNotFoundException {
    1: string message
}

// Определение сервиса
service OrderService {
    // Метод для создания нового заказа
    i64 createOrder(1: Order order),

    // Метод для получения заказа по ID
    Order getOrder(1: i64 id) throws (1: OrderNotFoundException notFound),

    // Метод для обновления статуса заказа
    void updateOrderStatus(1: i64 id, 2: OrderStatus new_status) throws (1: OrderNotFoundException notFound),

    // Метод для получения списка всех заказов
    list<Order> getAllOrders()
}