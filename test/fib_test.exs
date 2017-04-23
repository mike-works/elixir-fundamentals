defmodule FibTest do
  use ExUnit.Case
  @moduletag :exercise6

  test "Fib.normal(5) should return [1, 1, 2, 3, 5]" do
    assert Fib.normal(5) === [1, 1, 2, 3, 5]
  end

  test "Fib.reverse(5) should return [5, 3, 2, 1, 1]" do
    assert Fib.reverse(5) === [5, 3, 2, 1, 1]
  end

  test "Fib.reverse(0) should return []" do
    assert Fib.reverse(0) === []
  end

  test "Fib.normal(0) should return []" do
    assert Fib.normal(0) === []
  end

  test "Fib.normal(-5) should return nil" do
    assert Fib.normal(-5) === nil
  end

  test "Fib.reverse(-5) should return nil" do
    assert Fib.reverse(-5) === nil
  end
end