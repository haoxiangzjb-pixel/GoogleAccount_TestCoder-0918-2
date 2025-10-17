import random
import string
import os

# 定义一个类表示坐标点（模拟Scala样例类的行为）
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def __str__(self):
        return f"Point({self.x}, {self.y})"
    
    def __repr__(self):
        return self.__str__()
    
    # 模拟Scala样例类的copy方法
    def copy(self, x=None, y=None):
        new_x = x if x is not None else self.x
        new_y = y if y is not None else self.y
        return Point(new_x, new_y)

def generate_random_filename(extension="txt"):
    """生成随机文件名"""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    timestamp = str(int(os.getpid() * 1000000 + random.random() * 1000000))
    return f"point_{random_string}_{timestamp}.{extension}"

def save_point_to_file(point, filename):
    """将坐标点保存到文件"""
    with open(filename, 'w') as f:
        f.write(str(point))

# 创建坐标点实例
point = Point(3.5, 4.2)
print(f"创建的坐标点: {point}")

# 生成随机文件名
random_filename = generate_random_filename()

# 保存坐标点到随机命名的文件
save_point_to_file(point, random_filename)

print(f"坐标点已保存到文件: {random_filename}")

# 验证文件内容
with open(random_filename, 'r') as f:
    content = f.read()
    print(f"文件内容: {content}")