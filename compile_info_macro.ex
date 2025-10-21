defmodule CompileInfoMacro do
  @moduledoc """
  定义一个宏用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro print_and_save_compile_info(info) do
    # 获取当前时间戳作为随机部分的一部分
    timestamp = System.system_time(:second)
    # 生成随机数以确保文件名唯一
    random_part = :rand.uniform(1000000)
    filename = "compile_info_#{timestamp}_#{random_part}.ex"

    # 编译时输出信息
    IO.puts("编译时信息: #{inspect(info)}")
    IO.puts("信息已保存到文件: #{filename}")

    # 将信息保存到文件
    File.write!(filename, "编译时信息: #{inspect(info)}\n时间戳: #{timestamp}\n随机数: #{random_part}\n")

    # 返回一个简单的值，这样宏可以被正常使用
    quote do
      unquote(inspect(info))
    end
  end

  # 一个更复杂的宏，可以捕获更多的编译时上下文
  defmacro log_context(description \\ "") do
    timestamp = System.system_time(:second)
    random_part = :rand.uniform(1000000)
    filename = "context_#{timestamp}_#{random_part}.ex"

    # 获取当前文件和行号
    file = __CALLER__.file
    line = __CALLER__.line

    context_info = %{
      description: description,
      file: file,
      line: line,
      module: __CALLER__.module,
      function: __CALLER__.function,
      timestamp: timestamp
    }

    # 编译时输出信息
    IO.puts("上下文信息: #{inspect(context_info)}")
    IO.puts("详细信息已保存到: #{filename}")

    # 将上下文信息保存到文件
    File.write!(filename, """
    # 编译上下文日志
    描述: #{inspect(description)}
    文件: #{file}
    行号: #{line}
    模块: #{inspect(__CALLER__.module)}
    函数: #{inspect(__CALLER__.function)}
    时间戳: #{timestamp}
    随机标识符: #{random_part}
    """)

    # 返回一个简单的值
    quote do
      {:context_logged, unquote(description)}
    end
  end
end