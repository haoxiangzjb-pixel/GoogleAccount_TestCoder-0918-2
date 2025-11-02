defmodule CompileTimeInfo do
  defmacro print_compile_info do
    # 获取当前时间
    current_time = DateTime.utc_now()
    # 获取当前文件名
    file = __CALLER__.file
    # 获取当前行号
    line = __CALLER__.line
    # 获取模块名
    module = __CALLER__.module
    
    # 创建编译时信息
    compile_info = %{
      datetime: current_time,
      file: file,
      line: line,
      module: module,
      node: Node.self(),
      elixir_version: System.version(),
      otp_version: System.otp_release()
    }
    
    # 打印编译时信息
    IO.puts("编译时信息:")
    IO.puts("时间: #{DateTime.to_string(compile_info.datetime)}")
    IO.puts("文件: #{compile_info.file}")
    IO.puts("行号: #{compile_info.line}")
    IO.puts("模块: #{compile_info.module}")
    IO.puts("节点: #{compile_info.node}")
    IO.puts("Elixir版本: #{compile_info.elixir_version}")
    IO.puts("OTP版本: #{compile_info.otp_version}")
    
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16() |> String.downcase()
    filename = "compile_info_#{random_suffix}.ex"
    
    # 创建包含编译时信息的文件内容
    file_content = """
    # 编译时信息文件
    # 生成时间: #{DateTime.to_string(compile_info.datetime)}
    
    defmodule CompileInfo do
      def get_info do
        %{
          datetime: "#{DateTime.to_string(compile_info.datetime)}",
          file: "#{compile_info.file}",
          line: #{compile_info.line},
          module: #{inspect(compile_info.module)},
          node: #{inspect(compile_info.node)},
          elixir_version: "#{compile_info.elixir_version}",
          otp_version: "#{compile_info.otp_version}"
        }
      end
    end
    """
    
    # 将信息写入随机命名的文件
    File.write!(filename, file_content)
    IO.puts("编译时信息已保存到文件: #{filename}")
    
    # 返回一个简单的值，因为宏必须返回有效的Elixir语法
    quote do
      unquote(Macro.escape(compile_info))
    end
  end
end

# 使用示例
defmodule TestModule do
  require CompileTimeInfo
  
  # 调用宏来打印编译时信息并保存到文件
  compile_info = CompileTimeInfo.print_compile_info()
  
  def test_function do
    :ok
  end
end