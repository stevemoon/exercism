defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: "" 
  def encode(string), do:
    ({first, rest} = String.next_codepoint(string)
    _encode({first, String.next_codepoint(rest)}, 1, ""))
    #defp _encode({cur, {nil}}, cur_count, accum), do:
    #(accum <> cur_count <> cur)
  defp _encode({cur, nil}, cur_count, accum), do:
    (accum <> to_string(cur_count) <> cur)
  defp _encode({cur, {next, rest}}, cur_count, accum) when cur == next, do:
    _encode({next, String.next_codepoint(rest)}, cur_count + 1, accum)
  defp _encode({cur, {next, rest}}, cur_count, accum), do:
    _encode({next, String.next_codepoint(rest)}, 1, (accum <> to_string(cur_count) <> cur))

  @spec decode(String.t) :: String.t
  def decode(""), do: ""
  def decode(string), do: _decode(String.codepoints(string), "")
  def _decode([], accum), do: accum
  def _decode([count, char | rest], accum), do: _decode(rest, accum <> String.duplicate(char, String.to_integer(count)))
end
