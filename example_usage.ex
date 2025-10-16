defmodule ExampleUsage do
  require CompileTimeLogger

  # 使用宏记录单个信息
  CompileTimeLogger.log_and_save("Hello from compile time!")

  # 使用宏记录多个信息
  CompileTimeLogger.log_multiple_and_save([
    "First compile-time message",
    "Second compile-time message",
    "Third compile-time message"
  ])

  def test_function do
    "This is a test function"
  end
end