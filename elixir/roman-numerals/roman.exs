defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @romans [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"},
           {90, "XC"},  {50, "L"},   {40, "XL"}, {10, "X"},   {9, "IX"}, 
           {5, "V"},    {4, "IV"},   {1, "I"}]
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    numerals2(@romans, number, [])
    |> Enum.reverse
    |> Enum.join
  end

  defp numerals2([], _,  accum), do: accum
  defp numerals2([h | t], number, accum) do
    {num, rom} = numeral(h, number)
    numerals2(t, num, [rom | accum])
  end
  defp numeral({limit, roman}, number) when limit <= number do
    count = div(number, limit)
    remaining = rem(number, limit)
    {remaining, String.duplicate(roman, count)}
  end
  defp numeral({_limit, _roman}, number), do: {number, ""}

end