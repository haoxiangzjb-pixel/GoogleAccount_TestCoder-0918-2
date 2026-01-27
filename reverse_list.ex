defmodule ListUtils do
  def reverse_list(list) do
    Enum.reverse(list)
  end
end

# Example usage:
# ListUtils.reverse_list([1, 2, 3, 4]) # returns [4, 3, 2, 1]