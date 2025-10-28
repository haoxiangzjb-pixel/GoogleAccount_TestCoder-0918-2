const std = @import("std");
const print = std.debug.print;

// Define a structure to store point information
const Point = struct {
    x: f64,
    y: f64,
    
    // Method to create a new point
    fn init(x_val: f64, y_val: f64) Point {
        return Point{ .x = x_val, .y = y_val };
    }
    
    // Method to display point information
    fn display(self: Point) void {
        print("Point(x: {}, y: {})\n", .{ self.x, self.y });
    }
};

pub fn main() !void {
    // Create a point instance
    var point = Point.init(3.5, 7.2);
    
    // Display the point
    point.display();
    
    // Generate a random filename
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.clock_gettime(.realtime, &seed);
        break :blk seed;
    });
    const rand = prng.random();
    
    // Create random filename
    var filename: [16]u8 = undefined;
    const charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (&filename) |*char| {
        char.* = charset[rand.uintAtMost(usize, charset.len - 1)];
    }
    filename[filename.len - 1] = 0; // Ensure null termination for string
    
    // Add .dat extension to make it a proper file name
    var filepath_buffer: [32]u8 = undefined;
    const filepath = try std.fmt.bufPrint(&filepath_buffer, "{}.dat", .{filename[0..12]});
    
    // Write point data to the file
    const file = try std.fs.cwd().createFile(filepath, .{});
    defer file.close();
    
    // Write the point data as text
    try file.writeAll(try std.fmt.allocPrint(
        std.heap.page_allocator,
        "Point coordinates:\nx: {}\ny: {}\n",
        .{ point.x, point.y }
    ));
    
    print("Point data saved to file: {s}\n", .{filepath});
}