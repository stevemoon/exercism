defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b, do: :equal
  def compare([nil], []), do: :superlist
  def compare([], [nil]), do: :sublist
  def compare(a, b) when length(a) < length(b), do: _compare(a, b)
  def compare(a, b) when length(a) >= length(b) do
    case _compare(b, a) do
      :unequal -> :unequal
      :sublist -> :superlist
      _ -> :error
    end
  end
  defp _compare(shorter, longer) when length(shorter) > length(longer), do: 
    :unequal
  defp _compare(shorter, longer) when hd(shorter) !== hd(longer), do:
    _compare(shorter, tl(longer))
  defp _compare(shorter, longer) do
    if shorter === Enum.take(longer, length(shorter)) do
      :sublist
    else
      _compare(shorter, tl(longer))
    end
  end
<<<<<<< HEAD
end
=======
end


>>>>>>> origin/master
