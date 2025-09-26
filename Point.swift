import Foundation

/// Структура, представляющая точку в двумерном пространстве.
struct Point {
    var x: Double
    var y: Double
}

// Пример использования
let origin = Point(x: 0.0, y: 0.0)
let pointA = Point(x: 3.5, y: -2.1)

print("Начало координат: (\(origin.x), \(origin.y))")
print("Точка A: (\(pointA.x), \(pointA.y))")