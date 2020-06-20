defmodule Challenge do
  def solution(numbers, target) do 
    numbers = numbers |> Enum.with_index
    try do
      for i <- numbers do
        {iv, ii} = i
        sub_numbers = numbers |> Enum.drop(ii+1)
        IO.puts "Before inner loop"
        IO.inspect sub_numbers
        for j <- sub_numbers do
          {jv, ji} = j
          if iv+jv == target do
            throw({ii, ji})
          end
        end
      end
    catch
      v -> v
    end
  end
end

# https://www.codewars.com/kata/52c31f8e6605bcc646000082

Challenge.solution([
  11,9,3,5,6,2,5,7,10,1, 30
], 31) |> IO.inspect

Challenge.solution([
  11,9,3,5,6,2,5,7,10,1
], 11) |> IO.inspect

Challenge.solution([
  11,9,3,5,6,2,5,7,10,1
], 12) |> IO.inspect

# O(n^2)
