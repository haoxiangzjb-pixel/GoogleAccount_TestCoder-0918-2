import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Default initializer for origin point
    init() {
        self.x = 0.0
        self.y = 0.0
    }
}

// Example usage:
let origin = Point()
let pointA = Point(x: 3.5, y: 7.2)

print("Origin: (\(origin.x), \(origin.y))")
print("Point A: (\(pointA.x), \(pointA.y))")