defmodule ExampleModule do
  import CompileInfoMacro

  def example_function do
    print_and_save_compile_info("This is an example compile-time message")
    IO.puts("Runtime execution of example function")
  end

  def another_function do
    print_and_save_compile_info("Another compile-time message")
    IO.puts("Another function execution")
  end
end