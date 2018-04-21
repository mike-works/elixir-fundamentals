defmodule FizzBuzz do
  def play_game(number) when number >= 1 do
    1..number
    |> Enum.map(&player_turn/1)
    |> Enum.join(", ")
  end

  defp player_turn(number) do
    case number do
      x when rem(x, 15) === 0 -> "FizzBuzz" # divisible by 15
      x when rem(x, 3) === 0 -> "Fizz" # divisible by three
      x when rem(x, 5) === 0 -> "Buzz" # divisible by five
      x -> x # other numbers
    end
  end
end