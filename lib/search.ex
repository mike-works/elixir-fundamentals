defmodule Search do
  def start do
    
  end
  def run(term) do
    import Logger
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