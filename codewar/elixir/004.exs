defmodule Challenge do
  def solution(chars) do 
    error = chars
    |> String.split("")
    |> Enum.filter(fn elem -> elem != "" end)
    |> Enum.filter(&(!(get_ascii(&1) in ?a..?m)))
    |> Enum.count
    "#{error}/#{chars |> String.length}"
  end

  defp get_ascii(char), do: char |> String.to_charlist |> hd
end

defmodule Printererror do

  def printer_error(s) do
    error = s
    |> String.split("")
    |> Enum.filter(fn elem -> elem != "" end)
    |> Enum.filter(&(!(get_ascii(&1) in ?a..?m)))
    |> Enum.count
    "#{error}/#{s |> String.length}"
  end

  defp get_ascii(char), do: char |> String.to_charlist |> hd

end

# https://www.codewars.com/kata/56541980fa08ab47a0000040

"aaabbbbhaijjjm" |> Challenge.solution |> IO.puts
"aaaxbbbbyyhwawiwjjjwwm" |> Challenge.solution |> IO.puts

# O(n^4)
