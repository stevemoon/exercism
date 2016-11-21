defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    filtered = for x <- to_char_list(str), x in '[{()}]', do: x
    _chk_brkts(filtered, [])
  end
  
  defp _chk_brkts([],[]), do: :true
  defp _chk_brkts([head | tail], match_stack) when head in '[{(', do: 
   _chk_brkts(tail, [_close_brkt(head) | match_stack]) 
  defp _chk_brkts([head | tail], [match | rest]) when head == match, do:
   _chk_brkts(tail, rest)
  defp _chk_brkts(_, _), do: :false
  
  defp _close_brkt(?[), do: ?]
  defp _close_brkt(?{), do: ?}
  defp _close_brkt(?(), do: ?)
  defp _close_brkt(_), do: :err_not_open_brkt
  end