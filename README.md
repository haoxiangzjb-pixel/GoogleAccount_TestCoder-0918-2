# Elixir 编译时信息宏

这个项目定义了一个 Elixir 宏，用于在编译时打印信息并将其保存到随机命名的 `.ex` 文件中。

## 宏定义

`CompilerInfo.print_compile_info/1` 宏具有以下功能：

1. 在编译时打印传入的信息
2. 将信息保存到一个随机命名的 `.ex` 文件中
3. 文件名格式为：`compile_info_{timestamp}_{random_suffix}.ex`

## 使用示例

```elixir
defmodule TestModule do
  require CompilerInfo

  def test_function do
    CompilerInfo.print_compile_info("This is compile-time information")
  end

  def another_function do
    CompilerInfo.print_compile_info({:key, "value", [1, 2, 3]})
  end
end
```

## 工作原理

- 宏在编译时捕获传入的信息
- 在运行时生成包含时间戳和随机数的文件名
- 将编译时信息写入生成的 `.ex` 文件中
- 文件包含一个 Elixir 模块，可以稍后访问保存的信息

## 文件内容格式

生成的文件包含以下内容：
- 注释行，显示生成时间和原始信息
- 一个 Elixir 模块，包含访问原始信息的函数