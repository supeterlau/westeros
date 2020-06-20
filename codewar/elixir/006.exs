defmodule MorseCode do
  # use MorseCode.Constants # Defines @morse_codes
  @table %{}
  
  def decode(code) do
    code
    |> String.trim
    |> String.split("   ")
    |> Enum.map(
      fn v -> v |> String.split(" ") |> Enum.map(
        fn v -> Map.get(@morse_codes, v) end
      ) |> Enum.join end
    ) |> Enum.join(" ")
  end
end


".... . -.--   .--- ..- -.. ." |> MorseCode.decode |> IO.inspect


# https://www.codewars.com/kata/54b724efac3d5402db00065e/solutions/elixir
