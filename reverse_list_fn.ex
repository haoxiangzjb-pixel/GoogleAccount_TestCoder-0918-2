defmodule ListReverser do
  @doc """
  Reverses a list.
  """
  def reverse(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], acc), do: acc
  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end
end

# Example usage:
IO.inspect ListReverser.reverse([1, 2, 3, 4, 5]) # Output: [5, 4, 3, 2, 1]