defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string), do: _encode(String.codepoints(string), 1, "")
  defp _encode([], _count, accum), do: accum 
  defp _encode([last], count, accum), do: accum <> to_string(count) <> last
  defp _encode([cur, next | rest], count, accum) when cur == next, do: _encode([next | rest], count + 1, accum)
  defp _encode([cur, next | rest], count, accum), do: _encode([next | rest], 1, accum <> to_string(count) <> cur)

  @spec decode(String.t) :: String.t
  def decode(string), do: _decode(Regex.scan(~r{(\d+)([A-Z])}, string), "")
  def _decode([], accum), do: accum
  def _decode([[_, count, char] | rest], accum), do: _decode(rest, accum <> String.duplicate(char, String.to_integer(count)))
end
