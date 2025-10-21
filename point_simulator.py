import random
import string
from dataclasses import dataclass

# 模拟Scala样例类的功能
@dataclass
class Point:
    x: float
    y: float
    
    def __str__(self):
        return f"Point({self.x}, {self.y})"
    
    def copy(self, **kwargs):
        """模拟Scala样例类的copy方法"""
        new_kwargs = {'x': self.x, 'y': self.y}
        new_kwargs.update(kwargs)
        return Point(**new_kwargs)

def generate_random_filename(extension="txt"):
    """生成随机文件名"""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    return f"point_{random_string}.{extension}"

def save_point_to_file(point):
    """将坐标点保存到随机命名的文件中"""
    filename = generate_random_filename()
    
    with open(filename, 'w') as f:
        f.write(str(point))
    
    return filename

# 创建坐标点实例
point = Point(3.5, 4.2)

# 保存到随机命名的文件
filename = save_point_to_file(point)

print(f"坐标点已保存到文件: {filename}")
print(f"坐标点信息: {point}")

# 验证文件内容
with open(filename, 'r') as f:
    content = f.read()
    print(f"文件内容: {content}")