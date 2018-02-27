#   f(g(x))    pipe(x, [g, f, ...])
#              compose(x, [f, g, ...])
#  square = fn x -> ...
#  double = fn x -> 
# 
#  pipe(5, [square, double]) --> 2 * (5 ^ 2) = 50
#  compose(5, [square, double]) -> (5 * 2) ^ 2 = 100
# 
import IEx, only: [pry: 0]
defmodule ListUtilsTest do
  use ExUnit.Case
  @moduletag :exercise7

  test "Reduce to sum up items" do
    result = ListUtils.reduce([1, 2, 3], fn item, acc ->
      acc + item
      acc + item
    end, 0)
    assert 6 === result
  end
  
  test "compose test" do
    square = &(&1 * &1)
    double = &(&1 * 2)

    assert 100 === ListUtils.compose(5, [square, double]), "compose(5, [square, double]) should be 100"
  end

  test "Reduce to count items" do
    assert 3 === ListUtils.reduce([1, 2, 3], fn _item, acc ->
      acc + 1
    end, 0)
  end

  test "Map to square items" do
    assert [4, 9, 16] === ListUtils.map([2, 3, 4], fn item ->
      item * item
    end)
  end 
  
end