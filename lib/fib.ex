defmodule Fib do
  # NOTE: Enum.take([1, 2, 3, 4], -2) returns [3, 4]
  def normal(0), do: []
  def normal(1), do: [1]
  def normal(2), do: [1, 1]
  def normal(len) when len > 2 do
    # recursing to get list for len-1
    normal_result = normal(len - 1)
    # pluck two items off the end of the list
    [a, b] = Enum.take(normal_result, -2)
    # return normal(len - 1) and add the new item (a+b)
    normal_result ++ [a+b]
  end
  def normal(_), do: nil
  
  def reverse(0), do: []
  def reverse(1), do: [1]
  def reverse(2), do: [1, 1]
  
  def reverse(len) when len > 2 do
    # recursing to get list for len-1
    reverse_result = reverse(len - 1)
    # pluck two items off the beginning of the list
    [a, b | _tail] = reverse_result
    # return [a+b | reverse(len - 1)]
    [a+b  | reverse_result]
  end
  def reverse(_), do: nil
end