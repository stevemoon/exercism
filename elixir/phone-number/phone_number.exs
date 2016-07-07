defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    to_char_list(raw) |>
    _clean([]) |>
    _check_length |>
    to_string
  end
  defp _clean([], accum), do: Enum.reverse(accum)
  defp _clean([h | t], accum) when h in '0123456789', do: _clean(t, [h | accum])
  defp _clean([h | t], accum) when h in '.()- ', do: _clean(t, accum)
  defp _clean(_, _accum), do: '0000000000'

  defp _check_length(num) when length(num) == 10, do: num
  defp _check_length([h | t]) when length(t) == 10 and h == ?1, do: t
  defp _check_length(_num), do: '0000000000'

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    number(raw)  |>
    String.slice(0..2)
    #to_char_list |>
    #Enum.take(3) |>
    #List.to_string
  
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    pnum = to_string(number(raw) )
    ac = String.slice(pnum, 0..2)
    pfx = String.slice(pnum, 3..5)
    ext = String.slice(pnum, 6..9)
    "(#{ac}) #{pfx}-#{ext}"
  end
end
