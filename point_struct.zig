const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
    
    // Метод для вывода информации о точке
    pub fn display(self: Point) void {
        print("Point(x: {}, y: {})\n", .{ self.x, self.y });
    }
};

pub fn main() !void {
    // Создаем экземпляр структуры точки
    const myPoint = Point{ .x = 5.5, .y = 3.2 };
    
    // Выводим информацию о точке
    myPoint.display();
    
    // Генерируем случайное имя файла
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&myPoint)));
    const random = prng.random();
    
    // Используем временный файл с уникальным именем
    const random_name = try std.fmt.allocPrint(std.heap.page_allocator, "point_data_{}.txt", .{random.int(u32)});
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(random_name, .{});
    defer file.close();
    
    // Записываем информацию о точке в файл
    try file.writeAll(try std.fmt.allocPrint(std.heap.page_allocator, "Point coordinates: x = {}, y = {}", .{ myPoint.x, myPoint.y }));
    
    print("Data saved to file: {s}\n", .{random_name});
}