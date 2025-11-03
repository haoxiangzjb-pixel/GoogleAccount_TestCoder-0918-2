const std = @import("std");

pub fn max(a: i32, b: i32) i32 {
    return if (a > b) a else b;
}

pub fn main() void {
    const result = max(10, 20);
    std.debug.print("El máximo entre 10 y 20 es: {}\n", .{result});
}