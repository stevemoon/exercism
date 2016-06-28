defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    b = sig(base)
    for cand <- candidates, 
      b == sig(cand) and String.downcase(base) != String.downcase(cand), do: cand 
  end
  defp sig(word), do:
    word |> String.downcase |> to_char_list |> Enum.sort |> to_string
end
