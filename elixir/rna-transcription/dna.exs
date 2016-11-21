defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    for x <- dna, do: _d_to_r(x)
  end
  
  @spec _d_to_r(char) :: char
  defp _d_to_r(d) when d == ?A, do: ?U
  defp _d_to_r(d) when d == ?C, do: ?G
  defp _d_to_r(d) when d == ?T, do: ?A
  defp _d_to_r(d) when d == ?G, do: ?C
  defp _d_to_r(d), do: raise ArgumentError
<<<<<<< HEAD
end
=======
end
>>>>>>> origin/master
