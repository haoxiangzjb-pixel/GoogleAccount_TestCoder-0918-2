// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
};

// Пример использования
pub fn main() void {
    const my_point = Point{ .x = 3.5, .y = 7.2 };
    // Вывод координат точки (для демонстрации)
    _ = my_point;
}