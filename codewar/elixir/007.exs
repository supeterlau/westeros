defmodule MorseCode do
  # use MorseCode.Constants # Defines @morse_codes
  @morse_codes %{}
  
  def get_dots(bits, acc \\ "") do
    case bits do
      "" -> acc
      "0" <> tail -> 
        if acc == "" do
          get_dots(tail)
        else
          get_dots("", acc)
        end
      "1" <> tail ->
        acc = acc <> "1"
        get_dots(tail, acc)
    end
  end

  def decode_bits(bits, morse_codes, result \\ "", acc \\ "", acc_bit \\ "") do
    # morse_codes |> IO.inspect
    case bits do
      "" -> result
      "0" <> tail -> 
        result = if acc_bit != "0" do
          result <> (morse_codes |> Map.get(acc, ""))
        else
          result
        end
        acc = if acc_bit != "0" do
          "0"
        else
          acc <> "0"
        end
        acc_bit = "0"
        decode_bits(tail, morse_codes, result, acc, acc_bit)
      "1" <> tail ->
        result = if acc_bit != "1" do
          result <> (morse_codes |> Map.get(acc, ""))
        else
          result
        end
        acc = if acc_bit != "1" do
          "1"
        else
          acc <> "1"
        end
        acc_bit = "1"
        decode_bits(tail, morse_codes, result, acc, acc_bit)
    end
  end

  def decode(code) do
    dots = with bits <- get_dots(code),
         bits_length <- bits |> String.length do
      if rem(bits_length, 3) == 0 do
        bits |> String.slice(0..div(bits_length, 3)-1) 
      else
        bits
      end
    end
    dashs = dots |> String.duplicate(3)
    dots_length = dots |> String.length
    morse_codes = Map.merge(
      @morse_codes,
      %{
        String.duplicate("0", dots_length) => "",
        String.duplicate("0", dots_length*3) => " ",
        String.duplicate("0", dots_length*7) => "  ",
        dashs => "-",
        dots => ".",
      }
    )
    morse_codes |> IO.inspect
    code
    |> String.trim("0")
    |> decode_bits(morse_codes)
    |> String.split("  ")
    |> Enum.map(
      fn token -> do
        token
        |> String.split()
        |> Enum.map(
          fn word -> morse_codes |> Map.get(word, "") end
        )
        |> Enum.join
      end
    )
    |> Enum.join(" ")
  end
end


"1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011" |> MorseCode.decode |> IO.inspect
