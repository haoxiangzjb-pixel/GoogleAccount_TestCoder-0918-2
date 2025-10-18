// Структура для хранения информации о точке
const Point = struct {
    x: f64,
    y: f64,
};

// Пример использования структуры
const std = @import("std");

pub fn main() void {
    const point = Point{ .x = 3.14, .y = 2.71 };
    std.debug.print("Point: x={d}, y={d}\n", .{ point.x, point.y });
}