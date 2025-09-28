const std = @import("std");
const print = std.debug.print;
const File = std.fs.File;

// Определяем структуру Point
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    // Создаем экземпляр структуры Point
    const my_point = Point{ .x = 10.5, .y = -3.2 };

    // Генерируем случайное имя файла
    // Для простоты используем фиксированную строку и добавляем случайные числа
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.clock_gettime(.realtime, &seed);
        break :blk seed;
    });
    const random_number = prng.random().int(u32);
    const file_name = try std.fmt.allocPrint(std.heap.page_allocator, "point_data_{d}.txt", .{random_number});

    // Открываем файл для записи
    var file = try std.fs.cwd().createFile(file_name, .{});

    // Записываем данные точки в файл
    try file.writer().print("Point coordinates:\nx: {d:.2}\ny: {d:.2}\n", .{ my_point.x, my_point.y });

    // Закрываем файл
    file.close();

    print("Point data written to file: {s}\n", .{file_name});
}