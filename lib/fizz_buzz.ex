defmodule FizzBuzz do
  def play_game(number) when number >= 1 do
    1..number
    |> Enum.map(&player_turn/1)
    |> Enum.join(", ")
  end

  defp player_turn(number) do
    cond do
      rem(number, 15) === 0 -> "FizzBuzz"
      rem(number, 3) === 0 -> "Fizz"
      rem(number, 5) === 0 -> "Buzz"
      true -> number
    end
  end
end
