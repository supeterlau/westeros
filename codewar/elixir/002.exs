defmodule Challenge do
  def square?(number) do 
    try do
      for v <- 0..div(number,2) do
        cond do
          v * v > number -> 
            throw false
          v * v == number ->
            throw true
          true -> :ok
        end
      end
    catch
      v -> v
    end
  end
end

# https://www.codewars.com/kata/54c27a33fb7da0db0100040e/elixir

9 |> Challenge.square? |> IO.puts
10 |> Challenge.square? |> IO.puts
23 |> Challenge.square? |> IO.puts
230000 |> Challenge.square? |> IO.puts

# O(n)

#note 没想到可以用内置算法
