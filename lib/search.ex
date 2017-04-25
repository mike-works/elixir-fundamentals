defmodule Search do
  
  def start do
    receive do
      {sender_pid, {:complete_me, term}} ->
        results = Autocomplete.get_completions(term)
        IO.puts "Received term: #{term}, found #{length(results)} completions"
        send(sender_pid, {self(), {:completions, results}})        
    end
    start
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
      x ->
        Logger.error "Uknown message"
        IO.inspect x
        :sad 
    end
  end
end