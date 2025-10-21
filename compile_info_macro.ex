defmodule CompileInfoMacro do
  @moduledoc """
  宏模块，用于在编译时打印信息并将其保存到随机命名的.ex文件中
  """

  defmacro print_and_save_compile_info(message) do
    # 获取编译时信息
    compile_info = %{
      file: __CALLER__.file,
      module: __CALLER__.module,
      function: __CALLER__.function,
      line: __CALLER__.line,
      timestamp: DateTime.utc_now() |> DateTime.to_string(),
      node: Node.self()
    }

    # 生成随机文件名
    random_name = generate_random_filename()
    file_path = Path.join(File.cwd!(), random_name)

    # 创建包含编译信息的文件内容
    file_content = """
    # 编译时信息
    # 生成时间: #{compile_info.timestamp}
    
    %{
      message: #{inspect(message)},
      file: #{inspect(compile_info.file)},
      module: #{inspect(compile_info.module)},
      function: #{inspect(compile_info.function)},
      line: #{inspect(compile_info.line)},
      node: #{inspect(compile_info.node)}
    }
    """

    # 保存信息到文件
    File.write!(file_path, file_content)

    quote do
      # 在编译时打印信息
      IO.puts([
        "Compile-time info: ",
        unquote(message),
        " | File: ",
        unquote(compile_info.file),
        " | Line: ",
        to_string(unquote(compile_info.line)),
        " | Module: ",
        inspect(unquote(compile_info.module)),
        " | Saved to: ",
        unquote(file_path)
      ])

      # 返回原始值，不影响程序逻辑
      unquote(message)
    end
  end

  defp generate_random_filename do
    timestamp = System.system_time(:second)
    random_part = :crypto.strong_rand_bytes(8) |> Base.encode16() |> String.downcase()
    "compile_info_#{timestamp}_#{random_part}.ex"
  end
end