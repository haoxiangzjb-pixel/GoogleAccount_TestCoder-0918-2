import Foundation

/// Structure representing a point with x and y coordinates
struct Point {
    var x: Double
    var y: Double
    
    /// Initializes a point with given x and y coordinates
    init(x: Double = 0.0, y: Double = 0.0) {
        self.x = x
        self.y = y
    }
    
    /// Calculates the distance from this point to another point
    func distance(to other: Point) -> Double {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
    
    /// Returns a new point moved by the specified deltas
    func offset(byX deltaX: Double, byY deltaY: Double) -> Point {
        return Point(x: self.x + deltaX, y: self.y + deltaY)
    }
}

// Example usage:
let origin = Point()
let pointA = Point(x: 3.0, y: 4.0)
let pointB = Point(x: 7.0, y: 1.0)

print("Origin: (\(origin.x), \(origin.y))")
print("Point A: (\(pointA.x), \(pointA.y))")
print("Distance between A and B: \(pointA.distance(to: pointB))")

let offsetPoint = pointA.offset(byX: 2.0, byY: 3.0)
print("Point A offset by (2, 3): (\(offsetPoint.x), \(offsetPoint.y))")