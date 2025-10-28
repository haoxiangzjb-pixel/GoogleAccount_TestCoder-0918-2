# 引入宏定义
Code.require_file("print_compile_info.ex")

defmodule Example do
  # 使用宏导入功能
  import PrintCompileInfo

  def test_function do
    # 使用基本宏
    print_compile_info("This is a basic compile info test")
    
    # 使用详细宏
    print_detailed_compile_info("This is a detailed compile info test")
    
    # 无消息的详细宏
    print_detailed_compile_info()
  end

  def another_test do
    print_compile_info("Testing from another function")
  end
end

# 调用函数以触发宏执行
Example.test_function()
Example.another_test()