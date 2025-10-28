# 测试宏定义
defmodule TestMacros do
  defmacro simple_test do
    quote do
      file = __CALLER__.file
      module = __CALLER__.module
      function = __CALLER__.function
      
      IO.puts("File: " <> to_string(file))
      IO.puts("Module: " <> inspect(module))
      IO.puts("Function: " <> inspect(function))
    end
  end
end

defmodule Example do
  import TestMacros

  def test do
    simple_test()
  end
end

Example.test()