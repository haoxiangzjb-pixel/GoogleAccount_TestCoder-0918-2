import Foundation

/// A structure representing a point with x and y coordinates
struct Point {
    var x: Double
    var y: Double
    
    /// Initializes a point with the given x and y coordinates
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    /// Calculates the distance from this point to another point
    func distance(to other: Point) -> Double {
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx * dx + dy * dy)
    }
}

// Example usage:
/*
let point1 = Point(x: 3.0, y: 4.0)
let point2 = Point(x: 0.0, y: 0.0)
print("Point 1: (\(point1.x), \(point1.y))")
print("Point 2: (\(point2.x), \(point2.y))")
print("Distance between points: \(point1.distance(to: point2))")
*/