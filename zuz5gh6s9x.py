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
