defmodule Autocomplete do
  require Logger

  def get_completions(hint) do
    # Switch this to use get_completions_good
    {time, result} = measure(fn -> get_completions_bad(hint) end)
    Logger.info "Completed search for \"#{hint}\" in #{time}s"
    result
  end
  
  '''
  This is the enum (non-stream) version of the autocomplete function.
  '''
  defp get_completions_bad(hint) when is_bitstring(hint) and byte_size(hint) > 2 do
    lower_hint = String.downcase(hint)
    
    "words.txt"
    |> File.read!
    |> String.split("\n")
    |> Enum.filter(fn w -> String.starts_with?(w, lower_hint) end)
  end
  
  '''
  Implement something similar here, using streams
  '''
  defp get_completions_good(hint) when is_bitstring(hint) and byte_size(hint) > 2 do
    lower_hint = String.downcase(hint)
    # PUT EXERCISE 10 SOLUTION HERE
  end

  # a function used to benchmark the autocomplete
  defp measure(function) do
    parts = function
    |> :timer.tc
    
    time = elem(parts, 0)
    |> Kernel./(1_000_000)
    {time, elem(parts, 1)}
  end
  
end