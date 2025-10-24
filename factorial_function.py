import random
import string
import os

def factorial(n):
    """
    计算给定数字的阶乘
    
    参数:
    n (int): 非负整数
    
    返回:
    int: n的阶乘值
    
    异常:
    ValueError: 当n为负数时抛出
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result

def save_factorial_function_to_random_file():
    """
    将阶乘函数保存到一个随机命名的文件中
    """
    # 创建包含阶乘函数的Python代码
    factorial_code = '''def factorial(n):
    """
    计算给定数字的阶乘
    
    参数:
    n (int): 非负整数
    
    返回:
    int: n的阶乘值
    
    异常:
    ValueError: 当n为负数时抛出
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result
'''
    
    # 生成随机文件名
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    filepath = os.path.join('/workspace', random_filename)
    
    # 确保文件名唯一
    while os.path.exists(filepath):
        random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
        filepath = os.path.join('/workspace', random_filename)
    
    # 将代码写入随机命名的文件
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(factorial_code)
    
    print(f"阶乘函数已保存到文件: {filepath}")
    return filepath

# 示例使用
if __name__ == "__main__":
    # 测试阶乘函数
    print("5的阶乘是:", factorial(5))
    print("0的阶乘是:", factorial(0))
    print("10的阶乘是:", factorial(10))
    
    # 将阶乘函数保存到随机命名的文件
    saved_file = save_factorial_function_to_random_file()