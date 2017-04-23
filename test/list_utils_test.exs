defmodule ListUtilsTest do
  use ExUnit.Case
  @moduletag :exercise7

  test "Reduce to sum up items" do
    assert 6 === ListUtils.reduce([1, 2, 3], fn item, acc ->
      acc + item
    end, 0)
  end
  
  test "Reduce to count items" do
    assert 3 === ListUtils.reduce([1, 2, 3], fn item, acc ->
      acc + 1
    end, 0)
  end

  test "Map to square items" do
    assert [4, 9, 16] === ListUtils.map([2, 3, 4], fn item ->
      item * item
    end)
  end 
  
end