defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance([],[]), do: {:ok, 0} 
  def hamming_distance(s1, s2) when length(s1) == length(s2), do: 
    _ham(s1, s2, 0)
  def hamming_distance(_, _), do: {:error, "Lists must be the same length."}
  defp _ham([],[], count), do: {:ok, count}
  defp _ham([h1 | t1], [h2 | t2], count) when h1 == h2, do:
    _ham(t1, t2, count)
  defp _ham([h1 | t1], [h2 | t2], count) when h1 != h2, do: 
    _ham(t1, t2, count + 1)
end
