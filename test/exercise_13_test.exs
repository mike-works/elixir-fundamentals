defmodule Exercise13Test do
  use ExUnit.Case
  @moduletag :exercise13

  test "Map to square items" do
    assert [4, 9, 16] === ListUtils.pmap([2, 3, 4], fn item ->
      item * item
    end)
  end 
  
end