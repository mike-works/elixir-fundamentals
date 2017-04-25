defmodule FizzBuzz do
  def play_game(number) when number >= 1 do
    1..number # [1, 2, 3, 4, 5, 6]
    |> Enum.map(&player_turn/1) # [1, 2, "Fizz", 4, "Buzz", "FizzBuzz"]
    |> Enum.join(", ")
  end

  defp player_turn(number) do
    case number do
      _ when rem(number, 15) === 0 -> "FizzBuzz"
      _ when rem(number, 3) === 0 -> "Fizz"
      _ when rem(number, 5) === 0 -> "Buzz"
      x -> x 
    end
  end
end