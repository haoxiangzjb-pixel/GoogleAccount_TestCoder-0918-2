defmodule Greeter do
  @moduledoc """
  A simple greeter module in Elixir
  """

  @doc """
  Returns a greeting for the given name
  
  ## Examples
  
      iex> Greeter.greet("World")
      "Hello, World!"
      
      iex> Greeter.greet("Alice")
      "Hello, Alice!"
  """
  def greet(name) do
    "Hello, #{name}!"
  end
  
  @doc """
  Returns a general greeting
  
  ## Examples
  
      iex> Greeter.greet()
      "Hello, World!"
  """
  def greet() do
    greet("World")
  end
end