defmodule Example do
  require CompileTimeMacro

  def test_function do
    CompileTimeMacro.print_compile_info("This is a test message during compilation")
    IO.puts("Runtime execution completed")
  end

  def another_test do
    CompileTimeMacro.print_compile_info("Another compile-time message")
    "Compile-time macro executed"
  end
end

# 调用函数以演示运行时行为
Example.test_function()
IO.inspect(Example.another_test())