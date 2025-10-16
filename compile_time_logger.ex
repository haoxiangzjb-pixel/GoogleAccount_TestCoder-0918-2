defmodule CompileTimeLogger do
  @moduledoc """
  定义一个宏用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro log_and_save(message) do
    # 获取编译时的时间戳
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16() |> String.downcase()
    filename = "compile_log_#{random_suffix}.ex"
    
    # 编译时打印信息
    IO.puts("Compile-time log: #{inspect(message)} at #{timestamp}")
    
    # 准备要保存的内容
    content = """
    # Compile-time log file
    # Generated at: #{timestamp}
    # Message: #{inspect(message)}
    
    defmodule CompileLog do
      def get_message, do: #{inspect(message)}
      def get_timestamp, do: "#{timestamp}"
    end
    """
    
    # 保存到随机命名的文件
    File.write!(filename, content)
    IO.puts("Saved compile-time log to: #{filename}")
    
    # 返回宏的结果（这里简单返回message）
    quote do
      unquote(message)
    end
  end
  
  # 另一个版本的宏，可以记录多个信息
  defmacro log_multiple_and_save(messages) when is_list(messages) do
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16() |> String.downcase()
    filename = "compile_log_#{random_suffix}.ex"
    
    # 编译时打印信息
    Enum.each(messages, fn msg ->
      IO.puts("Compile-time log: #{inspect(msg)} at #{timestamp}")
    end)
    
    # 准备要保存的内容
    messages_str = Enum.map_join(messages, ",\n  ", fn msg -> inspect(msg) end)
    
    content = """
    # Compile-time log file
    # Generated at: #{timestamp}
    # Messages: #{inspect(messages)}
    
    defmodule CompileLog do
      def get_messages, do: [
        #{messages_str}
      ]
      
      def get_timestamp, do: "#{timestamp}"
    end
    """
    
    # 保存到随机命名的文件
    File.write!(filename, content)
    IO.puts("Saved compile-time log to: #{filename}")
    
    # 返回宏的结果
    quote do
      unquote(messages)
    end
  end
end