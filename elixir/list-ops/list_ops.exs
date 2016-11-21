defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: _count(l, 0)
  defp _count([], accum), do: accum
  defp _count([_head | tail], accum), do: _count(tail, accum + 1)

  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])
  defp _reverse([], accum), do: accum
  defp _reverse([head | tail], accum), do: _reverse(tail, [head | accum])


  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []
  def map([head | tail], f), do: [ f.(head) | map(tail, f) ] 
    

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f), do: []
  def filter([head | tail], f) do 
    if f.(head), do: [ head | filter(tail, f)],
    else: filter(tail, f)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, []), do: a
  def append(a, b), do: _append(a, b, []) |> reverse
  defp _append([], [], accum), do: accum
  defp _append([], b, accum), do: _append(b, [], accum)
  defp _append([head | tail], b, accum), do: _append(tail, b, [head | accum])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: for l <- ll, item <- l, do: item

end
