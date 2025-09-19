// Point.zig - Structure for storing point information

const std = @import("std");

// Define a Point structure with x and y coordinates
pub const Point = struct {
    x: f64,
    y: f64,

    // Initialize a new point
    pub fn init(x: f64, y: f64) Point {
        return Point{ .x = x, .y = y };
    }

    // Calculate distance from origin
    pub fn distanceFromOrigin(self: Point) f64 {
        return std.math.sqrt(self.x * self.x + self.y * self.y);
    }

    // Calculate distance to another point
    pub fn distanceTo(self: Point, other: Point) f64 {
        const dx = self.x - other.x;
        const dy = self.y - other.y;
        return std.math.sqrt(dx * dx + dy * dy);
    }

    // Move point by dx, dy
    pub fn translate(self: Point, dx: f64, dy: f64) Point {
        return Point{ .x = self.x + dx, .y = self.y + dy };
    }
};

// Example usage
pub fn main() void {
    // Create points
    var p1 = Point.init(3.0, 4.0);
    var p2 = Point.init(0.0, 0.0);

    // Calculate distances
    std.debug.print("Distance from origin to p1: {d}\n", .{p1.distanceFromOrigin()});
    std.debug.print("Distance from p1 to p2: {d}\n", .{p1.distanceTo(p2)});

    // Translate point
    var p3 = p1.translate(1.0, 1.0);
    std.debug.print("Translated point: ({d}, {d})\n", .{ p3.x, p3.y });
}