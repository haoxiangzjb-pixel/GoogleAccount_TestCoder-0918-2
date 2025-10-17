import random
import string
import os

# 定义Scala样例类的内容
scala_code = '''// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($$x, $$y)"
}

// 示例使用
val point = Point(3.5, 4.2)
println(point)
'''

# 生成随机文件名
def generate_random_filename():
    # 使用时间戳和随机字符生成唯一的文件名
    import time
    timestamp = int(time.time() * 1000)  # 毫秒时间戳
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
    return f"point_{timestamp}_{random_chars}.scala"

# 生成随机文件名
random_filename = generate_random_filename()

# 将Scala代码保存到随机命名的文件中
with open(random_filename, 'w') as file:
    file.write(scala_code)

print(f"Scala样例类已保存到文件: {random_filename}")
print("文件内容:")
print(scala_code)