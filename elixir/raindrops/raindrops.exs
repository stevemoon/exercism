defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    {number, []} 
    |> convert(7, "Plong")
    |> convert(5, "Plang")
    |> convert(3, "Pling")
    |> output
  end
  defp convert({num, results}, test, outtext) do
    case rem(num, test) do
      0 -> {num, [outtext | results]}
      _ -> {num, results}
    end
  end
  defp output({number, []}), do: to_string(number)
  defp output({number, results}), do: Enum.join(results)
<<<<<<< HEAD
end
=======
end
>>>>>>> origin/master
