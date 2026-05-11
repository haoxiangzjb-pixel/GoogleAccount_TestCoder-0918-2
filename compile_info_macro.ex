defmodule CompileInfoMacro do
  @moduledoc """
  定义一个宏，用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro print_compile_info() do
    # 获取编译时信息
    module = __CALLER__.module
    file = __CALLER__.file
    line = __CALLER__.line
    function = __CALLER__.function
    arity = __CALLER__.arity
    caller_module = inspect(__CALLER__.module)
    compile_time = DateTime.utc_now() |> DateTime.to_iso8601()

    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16(case: :lower)
    filename = "compile_info_#{random_suffix}.ex"

    # 准备要保存的内容
    content = """
    # 编译时信息 - 生成时间: #{compile_time}
    # 此文件由 CompileInfoMacro.print_compile_info/0 宏自动生成

    %{
      module: #{inspect(module)},
      file: "#{file}",
      line: #{line},
      function: #{inspect(function)},
      arity: #{arity},
      caller_module: "#{caller_module}",
      compile_time: "#{compile_time}",
      generated_filename: "#{filename}"
    }
    """

    # 写入文件
    File.write!(filename, content)

    # 生成 AST 代码，在编译时打印信息
    quote do
      IO.puts("========================================")
      IO.puts("编译时信息:")
      IO.puts("  模块: #{unquote(caller_module)}")
      IO.puts("  文件: #{unquote(file)}")
      IO.puts("  行号: #{unquote(line)}")
      IO.puts("  函数: #{inspect(unquote(function))}")
      IO.puts("  元数: #{unquote(arity)}")
      IO.puts("  编译时间: #{unquote(compile_time)}")
      IO.puts("  已保存到文件: #{unquote(filename)}")
      IO.puts("========================================")
    end
  end
end

# 示例使用模块
defmodule ExampleModule do
  @moduledoc """
  示例模块，演示如何使用 print_compile_info 宏
  """

  # 在模块级别调用宏
  require CompileInfoMacro
  CompileInfoMacro.print_compile_info()

  def sample_function(arg) do
    # 也可以在函数内部调用（虽然通常宏在编译时展开）
    arg
  end
end
