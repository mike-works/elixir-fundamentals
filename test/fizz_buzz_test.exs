defmodule FizzBuzzTest do
  use ExUnit.Case
  @moduletag :exercise9
  
  test "Playing up to 3" do
    assert FizzBuzz.play_game(3) === "1, 2, Fizz"
  end

  test "Playing up to 5" do
    assert FizzBuzz.play_game(5) === "1, 2, Fizz, 4, Buzz"
  end

  test "Playing up to 15" do
    assert FizzBuzz.play_game(15) === "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz"
  end

end