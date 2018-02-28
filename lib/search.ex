import Logger

defmodule Search do
  def start do
    info "#{inspect self()}: Start was called"
    receive do
      {sender_pid, {command, arg}} ->
        result = process_command(command, arg)
        send(sender_pid, {self(), result})
    end
    info "#{inspect self()}:Back to the start()"
    start()
  end

  defp process_command(:complete_me, search_term) do
    results = Autocomplete.get_completions(search_term)
    {:completions, results }
  end

  def do_search(search_pid, term) do
    # Send it a message
    to_send = {:complete_me, term}
    info "Sending"
    send(search_pid, {self(), to_send})

    info "Listening"
    # Listen for a response
    receive do
      {^search_pid, {:completions, items}} ->
        IO.inspect "Received response from"
        IO.inspect search_pid

        items
        |> Enum.join(", ")
        |> IO.puts
      message -> 
        IO.puts "Recieved message and did not know what to do"
        IO.inspect message
    end
  end

  def run() do
    # Kick off process
    child = spawn(Search, :start, [])
    info "Kicking off #{inspect child}"
    child
  end
end


# defmodule Chores do
#   def start do
#     receive do
#       :die ->
#         :timer.sleep(5000)
#         exit(:explode)
#     end
#   end
#   def run, do: spawn_link(Chores, :start, [])
# end
# Process.flag(:trap_exit, true)
# child_pid = Chores.run()
# send(child_pid, :die)
# receive do
#   {:EXIT, _, _reason} -> IO.puts "A child died :("
# end