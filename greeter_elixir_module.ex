defmodule Greeter do
  @moduledoc """
  Модуль приветствия.
  """

  @doc """
  Возвращает строку приветствия.

  ## Примеры

      iex> Greeter.hello("World")
      "Hello, World!"

  """
  def hello(name) do
    "Hello, #{name}!"
  end
end
