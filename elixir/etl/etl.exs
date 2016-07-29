defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    input         |>
    Map.to_list   |>
    invert(%{})
  end
  def invert([], accum), do: accum
  def invert([{key, value} | rest], accum) do
    cur = for x <- value, do: {String.downcase(x), key}
    invert(rest, Enum.into(cur, accum))
  end
end
