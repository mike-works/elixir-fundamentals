defmodule ListUtilsBoundsTest do
  use ExUnit.Case
  @moduletag :exercise8

  test "Bounds of a list of positive integers" do
    assert {1, 3} === ListUtils.bounds([1, 2, 3])
  end

  test "Bounds of a list of mixed integers" do
    assert {-71, 99} === ListUtils.bounds([1, 2, -71, 3, 99])
  end

  test "Bounds of an empty list" do
    assert {nil, nil} === ListUtils.bounds([])
  end 

  test "Bounds of a one-item list" do
    assert {3, 3} === ListUtils.bounds([3])
  end 
  
end