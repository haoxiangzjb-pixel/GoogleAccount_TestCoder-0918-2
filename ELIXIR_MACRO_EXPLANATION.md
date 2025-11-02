# Elixir宏：打印编译时信息并保存到随机命名文件

## 代码功能说明

`macro_example.ex` 文件定义了一个名为 `CompileTimeInfo` 的模块，其中包含一个宏 `print_compile_info`，该宏具有以下功能：

### 1. 收集编译时信息
- **时间**: 使用 `DateTime.utc_now()` 获取当前UTC时间
- **文件**: 使用 `__CALLER__.file` 获取当前文件路径
- **行号**: 使用 `__CALLER__.line` 获取宏调用所在的行号
- **模块**: 使用 `__CALLER__.module` 获取当前模块名
- **节点**: 使用 `Node.self()` 获取当前节点信息
- **Elixir版本**: 使用 `System.version()` 获取Elixir版本
- **OTP版本**: 使用 `System.otp_release()` 获取OTP版本

### 2. 打印信息到控制台
宏会将收集到的信息打印到控制台，格式如下：
```
编译时信息:
时间: 2023-01-01T00:00:00Z
文件: /path/to/file.ex
行号: 10
模块: TestModule
节点: nonode@nohost
Elixir版本: 1.15.0
OTP版本: 25
```

### 3. 生成随机命名的文件
- 使用 `:crypto.strong_rand_bytes(8)` 生成8字节的随机数据
- 通过 `Base.encode16() |> String.downcase()` 转换为小写十六进制字符串
- 文件名格式为 `compile_info_[随机后缀].ex`

### 4. 保存信息到文件
生成的文件包含一个 `CompileInfo` 模块，提供 `get_info/0` 函数来访问编译时信息。

## 预期输出示例

当运行 `elixir macro_example.ex` 时，控制台将显示：

```
编译时信息:
时间: 2023-01-01T12:00:00.000000Z
文件: /workspace/macro_example.ex
行号: 73
模块: TestModule
节点: nonode@nohost
Elixir版本: 1.15.7
OTP版本: 25.3
编译时信息已保存到文件: compile_info_a1b2c3d4e5f6g7h8.ex
```

同时，将创建一个随机命名的 `.ex` 文件，内容如下：
```elixir
# 编译时信息文件
# 生成时间: 2023-01-01T12:00:00.000000Z

defmodule CompileInfo do
  def get_info do
    %{
      datetime: "2023-01-01T12:00:00.000000Z",
      file: "/workspace/macro_example.ex",
      line: 73,
      module: TestModule,
      node: :nonode@nohost,
      elixir_version: "1.15.7",
      otp_version: "25.3"
    }
  end
end
```

## 使用方法

在Elixir环境中运行以下命令：
```bash
elixir macro_example.ex
```

## 技术要点

1. **宏在编译时执行**：宏在代码编译期间执行，而不是运行时
2. **`__CALLER__` 信息**: 提供关于宏调用上下文的信息
3. **`quote` 和 `unquote`**: 用于生成和插入Elixir AST
4. **文件I/O**: 在编译时进行文件操作

## 注意事项

- 需要安装Elixir 1.12+ 版本
- 随机文件名确保不会覆盖现有文件
- 宏返回的值可用于后续代码使用