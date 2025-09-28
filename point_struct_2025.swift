import Foundation

/// Структура, представляющая точку в двумерном пространстве.
struct Point {
    var x: Double
    var y: Double
}

// Пример использования
let pointA = Point(x: 3.5, y: 7.2)
let pointB = Point(x: -1.0, y: 4.8)

print("Точка A: (\(pointA.x), \(pointA.y))")
print("Точка B: (\(pointB.x), \(pointB.y))")

// Расчет расстояния между двумя точками
func distance(_ p1: Point, _ p2: Point) -> Double {
    let dx = p2.x - p1.x
    let dy = p2.y - p1.y
    return sqrt(dx * dx + dy * dy)
}

let dist = distance(pointA, pointB)
print("Расстояние между A и B: \(dist)")