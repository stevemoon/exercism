defmodule Bob do
  def hey(input1) do
    input = String.replace(input1, ~r{[0-9]}, "")
    cond do
      String.strip(input) == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?")  -> "Sure."
      String.ends_with?(input, "!") and String.upcase(input) != input-> "Whatever."
      String.upcase(input) == input and Regex.run(~r{\pL}, input) -> "Whoa, chill out!" 
      true -> "Whatever."
    end
  end
end
