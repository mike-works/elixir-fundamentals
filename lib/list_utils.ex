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

  # def pmap_processor(parent_pid, item, func) do
  #   try do
  #     message = {
  #       self(),
  #       {:result, func.(item) }
  #     }
  #     n = round(:rand.uniform * 1000)
  #     cond do
  #       n < 50 ->
  #         IO.puts "n = #{n}"
  #         # exit(:explode)
  #         1 = 2
  #       true ->
  #         :timer.sleep(n)
  #         send(parent_pid, message)
  #     end
  #   rescue e -> send(parent_pid, {:problem, e})
  #     IO.inspect e
  #   end
  # end
  def pmap_processor(item, func) do
    :timer.sleep(round(:rand.uniform * 1000))
    func.(item)
  end
  # Exercise 13
  def pmap(list, func) do
    # Add your exercise 13 solution here
    Process.flag(:trap_exit, true)
    list
    |> Enum.map(fn item ->
      # spawn_link(ListUtils,:pmap_processor,[self(), item, func])
      Task.async(fn ->
        :timer.sleep(round(:rand.uniform * 1000))
        func.(item)
      end)
    end)
    |> Enum.map(fn child_pid ->
      Task.await(child_pid)
      # receive do
      #   {^child_pid, {:result, r} } -> r  
      #   {:EXIT, ^child_pid, reason} ->
      #     IO.puts "A child died :( #{reason}"
      #     nil
      # end
    end)
    # |> use those PIDs to receive (in order) 
  end
end


IO.inspect ListUtils.bounds([1, 2, 3])