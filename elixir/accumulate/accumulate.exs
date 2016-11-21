defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun), do: _acc(list, fun, [])
  defp _acc([], _, accum), do: reverse(accum)
  defp _acc([head | tail], fun, accum), do: _acc(tail, fun, [fun.(head) | accum])
  
  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])
  defp _reverse([], accum), do: accum
  defp _reverse([head | tail], accum), do: _reverse(tail, [head | accum])

end