const std = @import("std");
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    const point = Point{ .x = 12.5, .y = -7.8 };
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var filename_buf: [64]u8 = undefined;
    const random_suffix = std.fmt.bufPrintIntToSlice(&filename_buf, @as(u128, @bitCast(std.time.nanoTimestamp())), 16, .lower, .{});

    var random_filename = std.ArrayList(u8).init(allocator);
    defer random_filename.deinit();

    try random_filename.appendSlice("point_data_");
    try random_filename.appendSlice(random_suffix);
    try random_filename.appendSlice(".bin");

    var file = try std.fs.cwd().createFile(random_filename.items, .{});
    defer file.close();
    try file.writeAll(std.mem.asBytes(&point));
    std.debug.print("Point data saved to {s}\n", .{random_filename.items});
}