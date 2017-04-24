defmodule ListUtils do
  # Exercise 7
  def reduce([], _reducer, accumulator), do: accumulator
  def reduce([head|tail], reducer, accumulator) do
    reduce(tail, reducer, reducer.(head, accumulator))
  end

  def map([], transform_fn, transformed), do: transformed
  def map([head|tail], transform_fn, transformed \\ []) do
    map(tail, transform_fn, transformed ++ [transform_fn.(head)])
  end

  # Exercise 8
  def bounds(list), do: {nil, nil}

  # Exercise 13
  def pmap(list, func) do
    # Add your exercise 13 solution here
  end
end