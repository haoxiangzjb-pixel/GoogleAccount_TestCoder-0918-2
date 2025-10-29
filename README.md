# Elixir 宏 - 编译时信息打印与保存

这个项目展示了如何在 Elixir 中定义宏来获取和保存编译时信息。

## 文件说明

### 1. `compile_info_macro.ex`
- 基础版本的宏，用于打印编译时信息并保存到随机命名的.ex文件中

### 2. `advanced_compile_info_macro.ex`
- 增强版本的宏，提供更多编译时信息细节

## 宏功能

1. **获取编译时信息**:
   - 模块名称
   - 文件路径
   - 行号
   - 当前函数
   - 别名列表
   - 上下文信息
   - Elixir 和 OTP 版本

2. **打印信息**:
   - 在控制台输出编译时信息

3. **保存到文件**:
   - 生成随机命名的 .ex 文件
   - 文件名格式: `compile_info_[timestamp]_[random_suffix].ex`

## 使用方法

```elixir
defmodule ExampleModule do
  require CompileInfoMacro
  
  # 使用宏打印编译时信息
  CompileInfoMacro.print_compile_info(__MODULE__)
  
  def hello do
    "Hello from ExampleModule!"
  end
end
```

## 运行示例

```bash
elixir compile_info_macro.ex
```

这将输出编译时信息到控制台，并创建一个随机命名的.ex文件来保存这些信息。