# Elixir 编译时日志宏

这个项目演示了一个Elixir宏，它可以在编译时打印信息并将其保存到随机命名的.ex文件中。

## 功能

- `log_and_save(message)`: 记录单个信息
- `log_multiple_and_save(messages)`: 记录多个信息

## 实现细节

`CompileTimeLogger` 模块包含两个宏：

1. `log_and_save/1` - 记录单条信息
2. `log_multiple_and_save/1` - 记录多条信息

这些宏在编译时执行，会：
- 打印信息到控制台
- 生成包含时间戳的随机命名.ex文件
- 在文件中保存原始信息和时间戳

## 示例输出

当编译使用这些宏的代码时，会看到如下输出：
```
Compile-time log: "Hello from compile time!" at 2025-10-16T12:03:33.616808Z
Saved compile-time log to: compile_log_361f98493b0e63b5.ex
```

并生成如下内容的文件：
```elixir
# Compile-time log file
# Generated at: 2025-10-16T12:03:33.616808Z
# Message: "Hello from compile time!"

defmodule CompileLog do
  def get_message, do: "Hello from compile time!"
  def get_timestamp, do: "2025-10-16T12:03:33.616808Z"
end
```

## 文件名生成

文件名格式为 `compile_log_{random_suffix}.ex`，其中 `random_suffix` 是8字节的随机数据转换为十六进制并转为小写。

## 使用方法

1. 编译宏模块: `elixirc compile_time_logger.ex`
2. 在代码中使用宏: `CompileTimeLogger.log_and_save("your message")`
3. 运行代码: `elixir your_file.ex`

编译时会生成日志文件并打印信息到控制台。