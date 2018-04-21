
defmodule Search do
  require Logger
  def start(search_history \\ []) do
    receive do
      {sender_pid, {:complete_me, term }} ->
        IO.puts "Last search was #{Enum.join(search_history, ", ")}. Begin search for #{term}"
        results = Autocomplete.get_completions(term)
        send(sender_pid, {self(), {:completions, results } })
        start([term | search_history])
      x ->
        Logger.error "Unknown message"
        IO.inspect x
        start
    end
  end
  def run(term) do
    # Kick off process
    Logger.info "Kicking off"
    search_pid = spawn(Search, :start, [])

    # Send it a message
    to_send = {:complete_me, term}
    Logger.info "Sending"
    send(search_pid, {self(), to_send})

    Logger.info "Listening"
    # Listen for a response
    receive do
      {search_pid, {:completions, items}} ->
        Logger.info "Received response"
        items
        |> Enum.join(", ")
        |> IO.puts
    end
  end
end