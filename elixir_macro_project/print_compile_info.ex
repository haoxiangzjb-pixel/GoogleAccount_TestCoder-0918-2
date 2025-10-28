defmodule PrintCompileInfo do
  @moduledoc """
  定义一个宏用于打印编译时信息并保存到随机命名的.ex文件中
  """

  defmacro print_compile_info(message) do
    quote bind_quoted: [message: message] do
      # 获取当前时间戳用于生成随机文件名
      timestamp = System.system_time(:second)
      random_suffix = :rand.uniform(10000)
      filename = "compile_info_#{timestamp}_#{random_suffix}.ex"

      # 编译时获取的信息
      compile_info = %{
        file: __ENV__.file,
        module: __ENV__.module,
        function: __ENV__.function,
        line: __ENV__.line,
        message: message,
        timestamp: timestamp
      }

      # 将信息保存到随机命名的文件中
      File.write(filename, inspect(compile_info, pretty: true))

      IO.puts("Compile-time info saved to: #{filename}")
      IO.inspect(message)
      IO.puts("Module: #{inspect(compile_info.module)}")
      IO.puts("File: #{inspect(compile_info.file)}")
      IO.puts("Function: #{inspect(compile_info.function)}")
      IO.puts("Line: #{compile_info.line}")
    end
  end

  # 另一个宏，提供更详细的信息
  defmacro print_detailed_compile_info(message \\ "") do
    quote bind_quoted: [message: message] do
      # 获取当前时间戳用于生成随机文件名
      timestamp = System.system_time(:second)
      random_suffix = :rand.uniform(10000)
      filename = "detailed_compile_info_#{timestamp}_#{random_suffix}.ex"

      # 详细编译时信息
      detailed_info = %{
        file: __ENV__.file,
        module: __ENV__.module,
        function: __ENV__.function,
        line: __ENV__.line,
        message: message,
        node: Node.self(),
        node_name: to_string(Node.self()),
        system_time: System.system_time(),
        monotonic_time: System.monotonic_time(),
        os_type: :os.type(),
        os_version: :os.version(),
        memory: :erlang.memory(:total),
        processes_count: length(:erlang.processes()),
        timestamp: timestamp
      }

      # 将详细信息保存到随机命名的文件中
      File.write(filename, inspect(detailed_info, pretty: true))

      IO.puts("Detailed compile-time info saved to: #{filename}")
      IO.puts("Message: #{inspect(message)}")
      IO.puts("Module: #{inspect(detailed_info.module)}")
      IO.puts("File: #{inspect(detailed_info.file)}")
      IO.puts("Function: #{inspect(detailed_info.function)}")
      IO.puts("Line: #{detailed_info.line}")
      IO.puts("Node: #{detailed_info.node_name}")
      IO.puts("OS Type: #{inspect(detailed_info.os_type)}")
      IO.puts("OS Version: #{inspect(detailed_info.os_version)}")
      IO.puts("Memory Used: #{detailed_info.memory} bytes")
      IO.puts("Number of Processes: #{detailed_info.processes_count}")
    end
  end
end