defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    vnuc = _validate_nuc(nucleotide)
    strand |>
    _validate_strand |>
    Enum.count(fn(x) -> x == vnuc end)
  end
  
  @spec _validate_strand([char]) :: [char]
  defp _validate_strand(strand) do
    invalids = Enum.count(strand, fn(x) -> not (x in @nucleotides) end)
    case invalids do
      0 -> strand
      _ -> raise ArgumentError
    end
  end

  @spec _validate_nuc(char) :: char
  defp _validate_nuc(nuc) when nuc in @nucleotides, do: nuc
  defp _validate_nuc(nuc), do: raise ArgumentError

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    _hist(@nucleotides, strand, []) |>
    Enum.into(%{})
  end
  defp _hist([], _, result), do: result
  defp _hist([nuc | rest], strand, result), do:
   _hist(rest, strand, [{nuc, count(strand, nuc)} | result ])
end