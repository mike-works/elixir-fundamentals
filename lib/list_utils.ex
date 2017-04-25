defmodule ListUtils do
  # Exercise 7
  def reduce([], _reducer, accumulator), do: accumulator
  def reduce([head|tail], reducer, accumulator) do
    reduce(tail, reducer, reducer.(head, accumulator))
  end

  # The silly version
  # def map([], transform_fn, transformed), do: transformed
  # def map([head|tail], transform_fn, transformed \\ []) do
  #   map(tail, transform_fn, transformed ++ [transform_fn.(head)])
  # end

  # The smarter version
  def map([], transform_fn, transformed), do: Enum.reverse(transformed)
  def map([head|tail], transform_fn, transformed \\ []) do
    updated_transformed_items = [transform_fn.(head) | transformed]
    map(tail, transform_fn, updated_transformed_items)
  end

  # Exercise 8
  def bounds([]), do: {nil, nil}
  # [8, .......]
  def bounds([head|tail]), do: bounds(tail, {head, head})

  ##### PRIVATE #####
  # no more work to do
  defp bounds([], bounds_tuple), do: bounds_tuple
  
  # head > max
  defp bounds([head|tail], {min, max}) when head > max, do: bounds(tail, {min, head})
  # head < min
  defp bounds([head|tail], {min, max}) when head < min, do: bounds(tail, {head, max})
  # neither
  defp bounds([_|tail], {min, max}), do: bounds(tail, {min,max})

  # Exercise 13
  def pmap(list, func) do
    # Add your exercise 13 solution here
  end
end