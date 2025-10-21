# Elixir Compile-Time Info Macro

这是一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 宏功能

`CompileInfoMacro.print_and_save_compile_info/1` 宏会：

1. 在编译时捕获以下信息：
   - 文件名
   - 模块名
   - 函数名
   - 行号
   - 时间戳
   - 节点信息

2. 将这些信息保存到一个随机命名的.ex文件中（格式：`compile_info_{timestamp}_{random_string}.ex`）

3. 在编译时打印相关信息到控制台

## 使用方法

```elixir
defmodule ExampleModule do
  import CompileInfoMacro

  def example_function do
    print_and_save_compile_info("This is an example compile-time message")
    IO.puts("Runtime execution of example function")
  end
end
```

## 示例输出

当编译使用此宏的代码时，您会看到类似以下的输出：

```
Compile-time info: This is an example compile-time message | File: /workspace/example_usage.ex | Line: 5 | Module: ExampleModule | Saved to: /workspace/compile_info_1761072070_db7d98d9463fd830.ex
```

同时，会在工作目录中生成一个包含编译时信息的.ex文件，例如：

```elixir
# 编译时信息
# 生成时间: 2025-10-21 18:41:10.630249Z

%{
  message: "This is an example compile-time message",
  file: "/workspace/example_usage.ex",
  module: ExampleModule,
  function: {:example_function, 0},
  line: 5,
  node: :nonode@nohost
}
```

## 文件说明

- `compile_info_macro.ex` - 宏的定义
- `example_usage.ex` - 使用宏的示例
- 随机命名的.ex文件 - 编译时生成的信息文件