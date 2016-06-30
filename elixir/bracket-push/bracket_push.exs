defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(""), do: :true
  def check_brackets(str) do
    _chk_brkts(to_char_list(str), {0,0,0})
  end
  defp _chk_brkts([], {0,0,0}), do: :true
  defp _chk_brkts([], _), do: :false
  defp _chk_brkts([?[ | tail], {square, brace, paren}), do: _chk_brkts(tail, {square + 1, brace, paren})
  defp _chk_brkts([?{ | tail], {square, brace, paren}), do: _chk_brkts(tail, {square , brace + 1, paren})
  defp _chk_brkts([?( | tail], {square, brace, paren}), do: _chk_brkts(tail, {square , brace, paren + 1})
  defp _chk_brkts([?] | tail], {square, brace, paren}) when square > 0, do:
    _chk_brkts(tail, {square - 1, brace, paren})
  defp _chk_brkts([?} | tail], {square, brace, paren}) when brace > 0, do:
    _chk_brkts(tail, {square, brace - 1, paren})
  defp _chk_brkts([?} | tail], {square, brace, paren}) when paren > 0, do:
    _chk_brkts(tail, {square, brace, paren - 1})
  defp _chk_brkts([_ | tail], accum), do: _chk_brkts(tail, accum)
end
