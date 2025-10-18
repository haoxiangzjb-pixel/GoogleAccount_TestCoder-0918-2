defmodule GreetingModule do
  @doc """
  Функция приветствия, которая возвращает строку приветствия
  """
  def greet(name) do
    "Привет, #{name}!"
  end

  @doc """
  Функция приветствия без параметров
  """
  def greet do
    "Привет, мир!"
  end
end