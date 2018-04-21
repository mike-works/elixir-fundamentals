defmodule ListUtils do
  # Exercise 7
  def reduce([], _reducer, accumulator), do: accumulator
  def reduce([h | t], reducer, accumulator) do
    new_acc = reducer.(h, accumulator)
    reduce(t, reducer, new_acc)
  end

  def map(original, transform_fn, transformed \\ []) do
    original
      |> reduce(fn (original_item, transformed_list) ->
        [transform_fn.(original_item) | transformed_list]
      end, [])
      |> Enum.reverse
  end

  # Exercise 8
  def bounds(list), do: {nil, nil}

  # Exercise 13
  def pmap(list, func) do
    parent_pid = self()
    list
    |> map(fn list_item ->
      spawn_link(fn -> 
        :timer.sleep(trunc((:rand.normal + 0.5) * 1000))
        send(parent_pid, {self(), func.(list_item) })
      end)
    end)
    |> map(fn child_pid -> 
      # Dispach    1, 2, 3, 4, 5, 6
      # ----1*
      # ------2*
      # --3     *
      # ---4     *
      # -----5    *
      # receive do {1, _ } end 
      receive do
        {^child_pid, transformed} -> transformed
      end
    end)
  end
end