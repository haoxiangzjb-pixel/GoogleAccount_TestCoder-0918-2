# Elixir Compile-Time Info Macro

这个项目定义了两个Elixir宏，用于打印编译时信息并将其保存到随机命名的.ex文件中。

## 宏定义

### `print_compile_info(message)`
- 打印基本的编译时信息
- 将信息保存到随机命名的文件中（格式：`compile_info_TIMESTAMP_RANDOM.ex`）

### `print_detailed_compile_info(message \\ "")`
- 打印详细的编译时信息
- 将信息保存到随机命名的文件中（格式：`detailed_compile_info_TIMESTAMP_RANDOM.ex`）

## 保存的信息

### `print_compile_info/1` 保存的信息：
- 文件路径
- 模块名
- 函数名
- 行号
- 传递的消息
- 时间戳

### `print_detailed_compile_info/1` 保存的信息：
- 以上所有信息
- 节点信息
- 操作系统类型和版本
- 内存使用情况
- 进程数量
- 系统时间
- 单调时间

## 使用方法

```elixir
# 引入宏定义
Code.require_file("print_compile_info.ex")

defmodule Example do
  import PrintCompileInfo

  def test_function do
    # 使用基本宏
    print_compile_info("This is a basic compile info test")
    
    # 使用详细宏
    print_detailed_compile_info("This is a detailed compile info test")
    
    # 使用详细宏（无消息）
    print_detailed_compile_info()
  end
end
```

## 文件生成

每次调用宏时，都会生成一个随机命名的.ex文件，其中包含编译时收集的信息。