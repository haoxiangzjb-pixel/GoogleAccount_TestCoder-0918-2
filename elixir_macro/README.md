# Elixir Compile-Time Information Macro

This project contains an Elixir macro that prints compile-time information and saves it to a randomly named `.ex` file.

## Files

- `compile_info_macro.ex`: Contains the macro definition and example usage

## How It Works

The `CompileInfoMacro` module defines a macro called `print_compile_info/1` that:

1. Collects compile-time information using `__CALLER__`:
   - File name
   - Module name
   - Function name (if inside a function)
   - Line number
   - Timestamp

2. Generates a random filename in the format `compile_info_{random_suffix}.ex`

3. Prints the information to the console

4. Saves the information to the randomly named file

5. Returns the description so the macro can be used in place

## Usage

To use this macro:

1. Install Elixir
2. Save the code to a file (e.g., `compile_info_macro.ex`)
3. Run: `elixir compile_info_macro.ex`

When the code is compiled, you'll see output similar to:

```
Compile-time information:
Description: Example usage of compile-time macro
File: compile_info_macro.ex
Module: Example
Function: nil
Line: 37
Timestamp: 2023-06-15 10:30:45.123456Z
Random file to be saved: compile_info_a1b2c3d4e5.ex
Saved compile-time information to compile_info_a1b2c3d4e5.ex
```

And a new file with a random name will be created containing the compile-time information in Elixir map format.

## Example

The example in the file shows how to use the macro both at the module level and inside a function.