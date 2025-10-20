defmodule CompileInfoMacro do
  @moduledoc """
  A module that defines a macro to print compile-time information
  and save it to a randomly named .ex file.
  """

  defmacro print_compile_info(description) do
    # Get compile-time information
    file = __CALLER__.file
    module = __CALLER__.module
    function = __CALLER__.function
    line = __CALLER__.line
    
    # Generate random filename
    random_suffix = :crypto.strong_rand_bytes(10) |> Base.encode16(case: :lower)
    filename = "compile_info_#{random_suffix}.ex"
    
    # Compile-time information to save
    compile_info = %{
      description: description,
      file: file,
      module: module,
      function: function,
      line: line,
      timestamp: DateTime.utc_now()
    }
    
    # Print compile-time information
    IO.puts("Compile-time information:")
    IO.puts("Description: #{description}")
    IO.puts("File: #{file}")
    IO.puts("Module: #{module}")
    IO.puts("Function: #{function}")
    IO.puts("Line: #{line}")
    IO.puts("Timestamp: #{DateTime.to_string(compile_info.timestamp)}")
    IO.puts("Random file to be saved: #{filename}")
    
    # Save the information to the randomly named file
    file_content = """
    # Compile-time information saved at #{DateTime.to_string(compile_info.timestamp)}
    # Description: #{description}
    
    %{
      description: "#{description}",
      file: "#{file}",
      module: #{inspect(module)},
      function: #{inspect(function)},
      line: #{line},
      timestamp: ~U[#{DateTime.to_iso8601(compile_info.timestamp)}]
    }
    """
    
    # Write the file during compilation
    File.write!(filename, file_content)
    IO.puts("Saved compile-time information to #{filename}")
    
    # Return a simple expression so the macro can be used
    quote do
      unquote(description)
    end
  end
end

# Example usage of the macro
defmodule Example do
  require CompileInfoMacro
  
  # This will print compile-time info and save it to a random file
  CompileInfoMacro.print_compile_info("Example usage of compile-time macro")
  
  def test_function do
    CompileInfoMacro.print_compile_info("Inside a function")
    :ok
  end
end