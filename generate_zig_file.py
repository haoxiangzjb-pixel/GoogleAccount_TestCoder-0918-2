import os
import random
import string
import tempfile

# Определяем содержимое файла на Zig
zig_content = '''// Определяем структуру Point
const Point = struct {
    x: f32,
    y: f32,
};

// Пример использования
pub fn main() void {
    const myPoint = Point{ .x = 3.14, .y = 2.71 };
    std.debug.print("Point: x={d}, y={d}\\n", .{ myPoint.x, myPoint.y });
}

const std = @import("std");
'''

# Генерируем случайное имя файла
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
random_filename = f"{random_name}.zig"

# Полный путь к файлу во временной директории
full_path = os.path.join("/tmp", random_filename)

# Создаем файл и записываем в него содержимое
with open(full_path, 'w') as f:
    f.write(zig_content)

print(f"Файл структуры Point на Zig создан: /tmp/{random_filename}")