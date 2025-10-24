import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

// Example usage:
let point = Point(x: 5.0, y: 3.0)
print("Point coordinates: (\(point.x), \(point.y))")