import Foundation

/// Структура, представляющая точку в двумерном пространстве.
struct Point {
    var x: Double
    var y: Double
    
    /// Инициализирует точку с заданными координатами.
    /// - Parameters:
    ///   - x: Координата x.
    ///   - y: Координата y.
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

// Пример использования
let pointA = Point(x: 3.5, y: 7.2)
print("Point A: (\(pointA.x), \(pointA.y))")

let pointB = Point(x: -1.0, y: 4.0)
print("Point B: (\(pointB.x), \(pointB.y))")
