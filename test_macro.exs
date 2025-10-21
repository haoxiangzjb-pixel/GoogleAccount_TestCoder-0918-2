# 测试宏的功能
Code.require_file("compile_info_macro.ex")

defmodule TestModule do
  import CompileInfoMacro

  def test_function do
    print_and_save_compile_info("Testing the macro functionality")
    :ok
  end
end

# 调用函数以确保宏在编译时执行
TestModule.test_function