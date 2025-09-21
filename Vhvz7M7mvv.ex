defmodule ListReverser do
  @moduledoc """
  A module containing functions to reverse lists in Elixir.
  """

  @doc """
  Reverses a list using recursion.
  
  ## Examples
  
      iex> ListReverser.reverse([1, 2, 3, 4])
      [4, 3, 2, 1]
      
      iex> ListReverser.reverse([])
      []
      
      iex> ListReverser.reverse(["a", "b", "c"])
      ["c", "b", "a"]
  """
  def reverse(list) do
    reverse_helper(list, [])
  end
  
  # Helper function that accumulates the reversed list
  defp reverse_helper([], acc), do: acc
  defp reverse_helper([head | tail], acc) do
    reverse_helper(tail, [head | acc])
  end
end