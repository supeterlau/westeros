defmodule Aretheythesame do
  	@spec comp([number], [number]) :: boolean
    def comp(a, b) do
      # your code
      with square_a <- a |> Enum.map(&(&1*&1)) do
        if Enum.count(a) == Enum.count(b) do
          for va <- square_a, vb <- b do
            va == vb
          end
          |> Enum.all?
        else
          b 
          |> Enum.all?(fn elem -> elem in square_a end)
        end
      end
    end
end

# https://www.codewars.com/kata/550498447451fbbd7600041c/

Aretheythesame.comp([2,2,3],[4,9,9]) |> IO.puts
# false in test

# O(n^3)

# 额外条件不清晰
