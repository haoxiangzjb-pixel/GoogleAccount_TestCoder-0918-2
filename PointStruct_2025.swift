import Foundation

/// Represents a point in 2D space with x and y coordinates.
struct Point {
    var x: Double
    var y: Double
}

// Example usage:
let pointA = Point(x: 3.5, y: 7.2)
let pointB = Point(x: -1.0, y: 4.8)

print("Point A: (\(pointA.x), \(pointA.y))")
print("Point B: (\(pointB.x), \(pointB.y))")

// Calculate distance between two points (optional extension)
extension Point {
    func distance(to other: Point) -> Double {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
}

let distance = pointA.distance(to: pointB)
print("Distance between A and B: \(distance)")