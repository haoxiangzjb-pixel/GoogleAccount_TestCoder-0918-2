// Структура для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
    
    // Метод для вывода информации о точке
    pub fn print(self: Point) void {
        std.debug.print("Point(x: {}, y: {})\n", .{ self.x, self.y });
    }
};

const std = @import("std");

pub fn main() !void {
    // Создаем экземпляр точки
    const point = Point{ .x = 3.5, .y = 7.2 };
    
    // Выводим информацию о точке
    point.print();
    
    // Генерируем случайное имя файла
    var seed: u64 = @intCast(std.time.microTimestamp());
    var prng = std.rand.DefaultPrng.init(seed);
    var random = prng.random();
    
    // Создаем имя файла из случайных символов
    var filename_buffer: [16]u8 = undefined;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    
    for (&filename_buffer) |*byte| {
        byte.* = charset[random.uintAtMost(charset.len - 1)];
    }
    
    var filename = try std.fmt.bufPrint(&filename_buffer, "{s}.dat", .{&filename_buffer});
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(filename, .{});
    defer file.close();
    
    // Записываем данные точки в файл
    try file.writeAll(std.mem.asBytes(&point));
    
    std.debug.print("Данные точки сохранены в файл: {s}\n", .{filename});
}