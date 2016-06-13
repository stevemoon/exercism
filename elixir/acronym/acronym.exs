defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string |>
    String.replace( ~r{[,-]}, " ") |>
    String.split |>
    Enum.map(fn(x) -> String.split(x, ~r{(?:(?<=^|[a-z])\B(?=[A-Z]))}) end) |>
    List.flatten |>
    Enum.map(fn(x) -> String.first(x) end) |>
    List.to_string |>
    String.upcase 
    end
end
