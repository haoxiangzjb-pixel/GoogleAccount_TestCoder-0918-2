defmodule CompilerMacro do
  @moduledoc """
  定义一个宏来打印编译时信息并保存到随机命名的.ex文件中
  """

  defmacro print_and_save_compile_info(module_name) do
    # 获取当前时间戳
    timestamp = System.system_time(:second)
    # 生成随机数
    random_num = :rand.uniform(1000000)
    # 生成随机文件名
    filename = "compile_info_#{timestamp}_#{random_num}.ex"
    
    # 编译时信息
    compile_info = %{
      module: unquote(module_name),
      file: __CALLER__.file,
      line: __CALLER__.line,
      timestamp: timestamp,
      random_id: random_num
    }
    
    # 将信息保存到文件
    File.write(filename, """
    # 编译时信息
    # 模块: #{inspect(compile_info.module)}
    # 文件: #{inspect(compile_info.file)}
    # 行号: #{inspect(compile_info.line)}
    # 时间戳: #{inspect(compile_info.timestamp)}
    # 随机ID: #{inspect(compile_info.random_id)}
    
    compile_info = #{inspect(compile_info)}
    """)
    
    quote do
      IO.puts("编译时信息已保存到: #{unquote(filename)}")
      IO.puts("模块: #{inspect(unquote(module_name))}")
      IO.puts("文件: #{inspect(__CALLER__.file)}")
      IO.puts("行号: #{inspect(__CALLER__.line)}")
      IO.puts("时间戳: #{inspect(unquote(timestamp))}")
      IO.puts("随机ID: #{inspect(unquote(random_num))}")
    end
  end
end

# 使用示例
defmodule TestModule do
  require CompilerMacro
  
  CompilerMacro.print_and_save_compile_info(__MODULE__)
  
  def hello do
    "Hello from TestModule"
  end
end