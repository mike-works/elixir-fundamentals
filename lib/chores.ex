defmodule Chores do
  def start, do: exit(:explode)
  def run do
    Process.flag(:trap_exit, true)
    pid = spawn_link(Chores, :start, [])
    receive do
      {:EXIT, pid, reason} ->
        IO.puts "Exited because: #{reason}"
    end
  end
end