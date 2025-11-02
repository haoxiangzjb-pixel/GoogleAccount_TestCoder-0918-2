# Elixir编译时信息宏

## 概述

这个项目定义了一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 文件说明

- `compiler_macro.ex`: 包含宏定义和使用示例的Elixir代码文件
- `README.md`: 本说明文件

## 宏功能

`CompilerMacro.print_and_save_compile_info/1` 宏的功能包括：

1. 在编译时获取模块信息
2. 生成包含时间戳和随机数的唯一文件名
3. 将编译时信息保存到随机命名的.ex文件中
4. 打印编译时信息到控制台

## 使用方法

如果有Elixir环境，可以通过以下命令运行：

```bash
elixir compiler_macro.ex
```

这将：
1. 编译并执行代码
2. 触发宏在编译时执行
3. 生成一个随机命名的.ex文件（格式为 `compile_info_TIMESTAMP_RANDOMID.ex`）
4. 在控制台打印编译时信息

## 代码说明

宏使用了以下Elixir特性：

- `__CALLER__` - 获取调用方的上下文信息
- `unquote` - 在宏中插入运行时值
- `quote` - 生成要插入到调用方的AST
- `System.system_time(:second)` - 获取当前时间戳
- `:rand.uniform/1` - 生成随机数

## 生成的文件内容

生成的文件将包含：
- 模块名称
- 源文件路径
- 行号
- 时间戳
- 随机ID
- 一个包含这些信息的Elixir map

## 注意

此代码需要Elixir运行时环境才能执行。如果环境中没有安装Elixir，可以将代码复制到有Elixir环境的地方运行。