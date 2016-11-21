defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise :error
  def nth(count) do
    Stream.iterate(2, &next_prime/1)
    |> Enum.take(count)
    |> List.last
  end
  
  def next_prime(2), do: 3
  def next_prime(n), do: next_prime2(n + 1)
  defp next_prime2(n) do
    max = round(:math.sqrt(n)) + 1
    factors = for x <- 2..max, rem(n, x) == 0, do: x
    case length(factors) do
      0 -> n
      _ -> next_prime2(n + 1)
    end
  end
end