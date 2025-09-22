import Foundation

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Function to calculate distance from origin
    func distanceFromOrigin() -> Double {
        return sqrt(x * x + y * y)
    }
    
    // Function to calculate distance to another point
    func distance(to otherPoint: Point) -> Double {
        let dx = x - otherPoint.x
        let dy = y - otherPoint.y
        return sqrt(dx * dx + dy * dy)
    }
}