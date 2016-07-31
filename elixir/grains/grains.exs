defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    power(2, number - 1)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    power(2, 64) - 1 
  end

  defp power(_, 0), do: 1
  defp power(x, 1), do: x 
  defp power(x, n) when n > 0, do: power(x, n, 1)
  defp power(_, n, acc) when n == 0, do: acc
  defp power(x, n, acc), do: power(x, n - 1, x * acc)
end
