const std = @import("std");

// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    // Создаем экземпляр структуры точки с заданными координатами
    const point = Point{ .x = 3.5, .y = 7.2 };
    
    // Генерируем имя файла с использованием временной метки для уникальности
    var buf: [32]u8 = undefined;
    const filename = try std.fmt.bufPrint(&buf, "point_{}.dat", .{std.time.milliTimestamp()});
    
    // Открываем (или создаем) файл для записи
    const file = try std.fs.cwd().createFile(filename, .{});
    defer file.close();
    
    // Записываем байты структуры точки в файл
    try file.writeAll(std.mem.asBytes(&point));
    
    // Выводим информацию о сохранении
    std.debug.print("Точка сохранена в файл: {s}\n", .{filename});
    std.debug.print("Координаты точки: x={}, y={}\n", .{ point.x, point.y });
}