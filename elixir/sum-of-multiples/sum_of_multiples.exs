defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    for x <- 1..limit, y <- factors, do: {x, y}
  end
  #defp factor_of?(testnum, factor)
  #  case rem(testnum, factor) do
    #    0 -> :true
    #      _ -> :false
    #end
    end

