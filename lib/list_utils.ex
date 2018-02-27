defmodule ListUtils do
  # Exercise 7
  def reduce([], _reducer, accumulator), do: accumulator
  def reduce([h|tail], reducer, accumulator) do
    reduce(tail, reducer, reducer.(h, accumulator))
  end

  def map(original, transform_fn) do
    reduce(original, fn (item, acc) ->
      acc ++ [transform_fn.(item)]
    end, [])
  end

  # compose(5, [square, double])
  # square(double(5))
  def compose(val, functions) do
    functions
    |> Enum.reverse
    |> reduce(fn (func, acc) ->
      func.(acc)
    end, val)
  end

  # Exercise 8
  def bounds([]), do: {nil, nil}
  def bounds(list) when length(list) >= 1 do
    [first| _] = list
    reduce(list, fn (item, {oldMin, oldMax}) ->
      {
        min(oldMin, item),
        max(oldMax, item)
      }
    end, {first, first})
  end


  # Exercise 13
  def pmap(list, func) do
    # Add your exercise 13 solution here
  end
end


IO.inspect ListUtils.bounds([1, 2, 3])