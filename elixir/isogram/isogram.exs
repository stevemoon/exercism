defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    orig = sentence
    |> String.downcase
    |> String.graphemes
    |> Enum.reject(fn(x) -> x in [" ", "-"] end)
    |> Enum.sort
    orig == Enum.uniq(orig)
  end
end