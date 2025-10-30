# C++ 模板交换函数与文件保存

这个项目包含一个通用的C++模板函数，用于交换两个变量的值，并将结果保存到随机命名的文件中。

## 功能说明

1. **模板交换函数** (`swapValues`): 
   - 采用模板设计，可交换任意类型的变量
   - 使用经典的三步交换算法

2. **随机文件名生成** (`generateRandomFilename`):
   - 生成包含随机数字的文件名
   - 默认格式为 `swap_result_[随机数].txt`

3. **结果保存** (`saveSwapResult`):
   - 将交换后的值保存到随机命名的文件中
   - 包含文件打开错误处理

## 代码结构

- `swapValues<T>(T& a, T& b)`: 模板函数，交换两个变量的值
- `generateRandomFilename()`: 生成随机文件名
- `saveSwapResult<T>(T& a, T& b, const std::string& filename)`: 保存交换结果到文件

## 使用示例

代码中包含了三种数据类型的示例：
- 整数 (int)
- 浮点数 (double) 
- 字符串 (std::string)

## 编译和运行

```bash
g++ -std=c++11 swap_template.cpp -o swap_template
./swap_template
```

程序会输出交换前后的值，并显示保存结果的文件名。