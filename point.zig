const std = @import("std");
const Point = struct {
    x: f64,
    y: f64,
};

pub fn main() !void {
    const point = Point{ .x = 3.14, .y = 2.71 };
    
    // Генерация случайного имени файла
    var prng = std.rand.DefaultPrng.init(@as(u64, @intFromPtr(&point)));
    var random = prng.random();
    
    var filename_buffer: [20]u8 = undefined;
    const alphabet = "abcdefghijklmnopqrstuvwxyz0123456789";
    for (filename_buffer) |*char| {
        char.* = alphabet[random.uintAtMost(usize, alphabet.len - 1)];
    }
    filename_buffer[0] = 'p'; // Начинаем с 'p' для удобства идентификации
    filename_buffer[1] = 't'; // Затем 't' 
    var filename = try std.fmt.bufPrint(&filename_buffer, "{s}.dat", .{filename_buffer[0..16]});
    
    const file = try std.fs.cwd().createFile(filename, .{});
    defer file.close();
    
    try file.writeAll(std.mem.asBytes(&point));
    
    std.debug.print("Точка {{x={}, y={}}} сохранена в файл {}\n", .{ point.x, point.y, filename });
}