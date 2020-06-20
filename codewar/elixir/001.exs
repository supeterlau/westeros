defmodule Challenge do
  def solution(number) do 
    0..number-1
    |> Enum.filter(fn x -> rem(x,3) == 0 || rem(x,5) == 0 end)
    |> Enum.sum
  end
end

# https://www.codewars.com/kata/514b92a657cdc65150000006/elixir

9 |> Challenge.solution |> IO.puts
10 |> Challenge.solution |> IO.puts
23 |> Challenge.solution |> IO.puts

# 时间复杂度 two-level loop: O(n^2)
