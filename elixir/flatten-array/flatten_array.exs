defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> Flattener.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> Flattener.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten([]), do: []
  def flatten([h | t]) when h == nil, do: flatten(t)
  def flatten([h | t]), do: flatten(h) ++ flatten(t)
  def flatten(nonlist), do: [nonlist]
end
