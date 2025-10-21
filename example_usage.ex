# 引入宏定义
defmodule Example do
  require CompileInfoMacro

  # 使用第一个宏
  CompileInfoMacro.print_and_save_compile_info("这是一个测试信息")

  # 使用第二个宏
  CompileInfoMacro.log_context("示例模块中的上下文")

  def test_function do
    # 在函数内部使用宏
    CompileInfoMacro.log_context("在 test_function 函数中")
    :ok
  end

  def another_function(value) do
    # 在带有参数的函数中使用宏
    CompileInfoMacro.print_and_save_compile_info({:function_call, value, self()})
    value * 2
  end
end

# 编译时输出示例
IO.puts("模块 Example 编译完成")