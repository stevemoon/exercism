defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
<<<<<<< HEAD
    foo = for x <- 1..limit, y <- factors, do: {x, y}
    sum(foo, 0)
  end
  defp sum([], accum), do: accum
  #defp sum({factor, test}, accum), do: sum([{factor, test}], accum)
  defp sum([{factor, test} | rest], accum) do
    case rem(test, factor) do
      0 -> sum(rest, accum + factor)
      _ -> sum(rest, accum)
    end
  end

  #defp factor_of?(testnum, factor)
  #  case rem(testnum, factor) do
    #    0 -> :true
    #      _ -> :false
    #end
    end

=======

  end
end
>>>>>>> origin/master
