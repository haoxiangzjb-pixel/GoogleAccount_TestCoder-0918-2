const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

pub fn main() !void {
    // Определяем структуру точки
    const Point = struct {
        x: f32,
        y: f32,
    };

    // Создаем экземпляр точки
    const my_point = Point{ .x = 3.14, .y = 2.71 };

    // Инициализируем рандомайзер
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&my_point)));
    var rand = prng.random();

    // Генерируем случайное имя файла
    const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
    var file_name_buffer: [16]u8 = undefined;
    for (&file_name_buffer) |*c| {
        c.* = alphabet[rand.intRangeAtMost(usize, 0, alphabet.len - 1)];
    }
    const file_name = try std.fmt.allocPrint(std.heap.page_allocator, "{}.dat", .{std.mem.span(&file_name_buffer)});

    print("Сохраняем точку ({d}, {d}) в файл {s}...\n", .{ my_point.x, my_point.y, file_name });

    // Открываем файл для записи
    const file = try std.fs.cwd().createFile(file_name, .{});

    // Создаем сериализатор
    var serializer = std.io.serializer(.Little, .{ .buf = &[_]u8{} }, file.writer());

    // Сериализуем и записываем данные
    try serializer.serialize(my_point.x);
    try serializer.serialize(my_point.y);

    file.close();

    print("Точка успешно сохранена.\n", .{});
}