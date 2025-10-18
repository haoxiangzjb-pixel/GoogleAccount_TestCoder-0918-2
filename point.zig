// Структура для хранения информации о точке
const Point = struct {
    x: f64,
    y: f64,
};

// Функция для сохранения точки в файл
pub fn savePointToFile(point: Point, filename: []const u8) !void {
    const file = try std.fs.cwd().createFile(filename, .{});
    defer file.close();

    // Преобразуем точку в строку и запишем в файл
    var buffer: [100]u8 = undefined;
    const point_str = try std.fmt.bufPrint(&buffer, "{{x: {d}, y: {d}}}", .{ point.x, point.y });
    _ = try file.write(point_str);
}

// Пример использования
const std = @import("std");

pub fn main() !void {
    const point = Point{ .x = 3.14, .y = 2.71 };
    
    // Генерация случайного имени файла
    var seed: u64 = @truncate(std.time.milliTimestamp());
    var prng = std.rand.DefaultPrng.init(seed);
    var random = prng.random();
    
    var filename_buffer: [20]u8 = undefined;
    const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
    
    for (filename_buffer) |*byte| {
        byte.* = alphabet[random.uintAtMost(usize, alphabet.len - 1)];
    }
    
    const filename = try std.fmt.bufPrint(&filename_buffer, "{}.dat", .{});
    
    try savePointToFile(point, filename);
    std.debug.print("Точка сохранена в файл: {s}\n", .{filename});
}