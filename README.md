# Elixir Compile-Time Macro

这是一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 功能

- 在编译时捕获并打印以下信息：
  - 源文件路径
  - 模块名称
  - 函数名称
  - 行号
  - 传入的消息
  - 时间戳
- 将编译时信息保存到随机命名的.ex文件中
- 保持原始表达式的运行时行为

## 使用方法

```elixir
defmodule Example do
  require CompileTimeMacro

  def test_function do
    CompileTimeMacro.print_compile_info("This is a test message during compilation")
    IO.puts("Runtime execution completed")
  end
end
```

## 实现细节

宏使用了Elixir的宏系统特性，包括：

- `__CALLER__` 获取调用方的上下文信息
- `Macro.to_string/1` 将AST转换为字符串
- `:crypto.strong_rand_bytes/1` 生成随机后缀用于文件名
- `DateTime.utc_now/0` 获取当前时间戳

编译时，宏会输出信息到控制台并创建一个包含编译时信息的.ex文件，文件名格式为 `compile_info_[随机后缀].ex`。