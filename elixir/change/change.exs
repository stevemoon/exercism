defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    generate2(amount, Enum.reverse(Enum.sort(values)), %{})
  end

  defp generate2(0, _, results), do: {:ok, results}
  defp generate2(_, [], _), do: :error
  defp generate2(val, [coin | rest], results) do
      remaining = rem(val, coin)
      coin_count = div(val, coin)
      generate2(remaining, rest, Map.put(results, coin, coin_count))
  end
end
