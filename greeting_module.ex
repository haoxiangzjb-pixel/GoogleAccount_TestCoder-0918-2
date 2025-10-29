defmodule GreetingModule do
  @moduledoc """
  A module that provides greeting functionality.
  """

  @doc """
  Returns a greeting message.
  """
  def greet(name) do
    "Hello, #{name}! Welcome to Elixir!"
  end

  @doc """
  Returns a simple hello message.
  """
  def hello do
    "Hello, World!"
  end
end