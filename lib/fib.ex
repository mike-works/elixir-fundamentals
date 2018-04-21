defmodule Fib do
  # NOTE: Enum.take([1, 2, 3, 4], -2) returns [3, 4]
  
  def reverse(0), do: []
  def reverse(1), do: [1]
  def reverse(2), do: [1, 1]
  def reverse(x) when x > 2 do 
    prev = reverse(x - 1) # [3, 2, 1, 1]
    [one_ago | [ two_ago | _ ] ] = prev # 3    2
    [(one_ago + two_ago) | prev ] # [(3+2), 3, 2, 1, 1]
  end
  def reverse(x), do: nil
  
  
  def normal(0), do: []
  def normal(1), do: [1]
  def normal(2), do: [1, 1]
  def normal(x) when x > 2 do
    prev = normal(x - 1)
    [two_ago, one_ago] = 
      prev
      |> Enum.take(-2)
    # 1 1 2 (3 5)
    prev ++ [(two_ago + one_ago)]
  end
  def normal(x), do: nil

end