// Определение структуры для хранения информации о точке
const Point = struct {
    x: f32,
    y: f32,
    
    // Метод для вывода информации о точке
    pub fn print(self: Point) void {
        std.debug.print("Point(x: {}, y: {})\n", .{ self.x, self.y });
    }
};

// Пример использования структуры
const std = @import("std");

// В обычных условиях эту программу нужно скомпилировать и запустить с помощью команд:
// zig build-exe point_struct.zig
// ./point_struct
pub fn main() !void {
    // Создаем экземпляр точки
    const myPoint = Point{ .x = 5.7, .y = 8.3 };
    
    // Выводим информацию о точке
    myPoint.print();
    
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
    
    // Добавляем расширение к имени файла
    var full_filename: [20]u8 = undefined;
    @memcpy(full_filename[0..16], &filename_buffer);
    @memcpy(full_filename[16..20], ".dat");
    
    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(&full_filename, .{});
    defer file.close();
    
    // Записываем данные точки в файл в бинарном формате
    try file.writeAll(std.mem.asBytes(&myPoint));
    
    std.debug.print("Данные точки сохранены в файл: {s}\n", .{&full_filename});
}