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
  def pmap(list, func) do # [1, 2, 3, 4]
    parent_pid = self()
    # 1. map over the list, kick off a new process for each
    #    ↪  [PID, PID, PID, PID]
    list
    |> Enum.map(fn item ->
        spawn_link(fn ->
          # 1a. transform list[i]
          transformed_item = func.(item)
          # 1b. send a message back to the parent process w/ the result
          send(parent_pid, {self(), transformed_item})
        end)
    end)
    # 2. wait for messages to come back, return the tranformed list[i] to form a new list
    #    ↪  [transformed list[0], transformed list[1], ...]
    |> Enum.map(fn child_pid ->
      receive do
        {^child_pid, transformed_item} -> transformed_item
        x -> "WTF?#{inspect x}"
      end
    end)
 end
end