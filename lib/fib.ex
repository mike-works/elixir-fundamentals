defmodule Fib do
  # NOTE: Enum.take([1, 2, 3, 4], -2) returns [3, 4]
  
  def normal(0), do: []
  def normal(1), do: [1]
  def normal(2), do: [1, 1]
  def normal(x) when x < 0, do: nil
  def normal(x) when x > 2 do
    l = normal(x - 1) # get sequence of length x-1
    # l |> Enum.take(-2)
    [a, b] = Enum.take(l, -2) # calculate the next value
    l ++ [a + b] # return sequence of length x
  end
  def reverse(x) when x < 0, do: nil
  def reverse(x) do
    x
    |> normal
    |> Enum.reverse
  end

end