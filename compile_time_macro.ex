defmodule CompileTimeMacro do
  @moduledoc """
  Defines a macro to print and save compile-time information to a randomly named .ex file.
  """

  defmacro print_compile_info(message) do
    # 获取当前时间戳
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16(case: :lower)
    filename = "compile_info_#{random_suffix}.ex"
    
    # 编译时信息 - 保存AST结构，而不是尝试解包message
    compile_info = %{
      file: __CALLER__.file,
      module: __CALLER__.module,
      function: __CALLER__.function,
      line: __CALLER__.line,
      message: Macro.to_string(message),
      timestamp: timestamp
    }
    
    # 打印信息到控制台
    IO.puts("Compile-time Info:")
    IO.puts("File: #{inspect(compile_info.file)}")
    IO.puts("Module: #{inspect(compile_info.module)}")
    IO.puts("Function: #{inspect(compile_info.function)}")
    IO.puts("Line: #{compile_info.line}")
    IO.puts("Message AST: #{inspect(compile_info.message)}")
    IO.puts("Timestamp: #{compile_info.timestamp}")
    IO.puts("Saved to: #{inspect(filename)}")
    
    # 将信息写入随机命名的文件
    file_content = """
    # Compile-time Information
    # Generated at: #{inspect(compile_info.timestamp)}
    # Source file: #{inspect(compile_info.file)}
    # Module: #{inspect(compile_info.module)}
    # Function: #{inspect(compile_info.function)}
    # Line: #{inspect(compile_info.line)}
    
    compile_info = %{
      file: #{inspect(compile_info.file)},
      module: #{inspect(compile_info.module)},
      function: #{inspect(compile_info.function)},
      line: #{inspect(compile_info.line)},
      message_ast: #{inspect(compile_info.message)},
      timestamp: #{inspect(compile_info.timestamp)}
    }
    
    # You can use this information in your code
    # For example, to access the compile-time message:
    # compile_info.message
    """
    
    File.write(filename, file_content)
    
    # 返回原始表达式（不改变宏调用的行为）
    quote do
      unquote(message)
    end
  end
end