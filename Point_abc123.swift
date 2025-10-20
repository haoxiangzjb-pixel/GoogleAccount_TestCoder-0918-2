struct Point {
    var x: Double
    var y: Double
    
    // Initialize with default values
    init() {
        self.x = 0.0
        self.y = 0.0
    }
    
    // Initialize with custom values
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    // Method to get distance from origin
    func distanceFromOrigin() -> Double {
        return sqrt(x * x + y * y)
    }
    
    // Method to print point coordinates
    func describe() {
        print("Point(\(x), \(y))")
    }
}

// Example usage:
let origin = Point()
let pointA = Point(x: 3.0, y: 4.0)

origin.describe()  // Output: Point(0.0, 0.0)
pointA.describe()  // Output: Point(3.0, 4.0)

print("Distance from origin: \(pointA.distanceFromOrigin())")  // Output: Distance from origin: 5.0