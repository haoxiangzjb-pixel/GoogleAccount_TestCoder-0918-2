const std = @import("std");
const print = std.debug.print;

// Структура для хранения информации о точке
const Point = struct {
    x: f64,
    y: f64,
    
    // Метод для вывода информации о точке
    pub fn display(self: Point) void {
        print("Point({d}, {d})\n", .{ self.x, self.y });
    }
};

pub fn main() !void {
    // Создаем экземпляр точки
    var point = Point{ .x = 3.5, .y = 7.2 };
    
    // Генерируем случайное имя файла
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&point)));
    var rand = prng.random();
    
    var filename_buffer: [16]u8 = undefined;
    const charset = "abcdefghijklmnopqrstuvwxyz0123456789";
    
    for (filename_buffer) |*byte| {
        byte.* = charset[rand.uintAtMost(usize, charset.len - 1)];
    }
    
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    
    var filename = try std.fmt.allocPrint(allocator, "point_{}.dat", .{std.fmt.fmtSliceHexLower(&filename_buffer)});
    
    // Открываем файл для записи
    var file = try std.fs.cwd().createFile(filename, .{});
    defer file.close();
    
    // Сохраняем точку в файл
    try file.writeAll(std.mem.asBytes(&point));
    
    print("Точка сохранена в файл: {s}\n", .{filename});
    print("Координаты точки: ", .{});
    point.display();
}