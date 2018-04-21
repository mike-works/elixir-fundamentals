
formatter = fn(symbol) ->
  #return
  fn
    0 -> "#{0}"
    x when x > 0 -> "#{symbol} #{x}"
    x when x < 0 -> "(#{symbol} #{-x})"
  end
end

##### TESTS #####
test = fn to_run, expected, description ->
  require Logger
  result = to_run.()
  try do
    ^expected = result
      Logger.info "PASSED: #{description}"
  rescue
    _ in MatchError ->
      Logger.error "FAILED: #{description}\n\tFOUND: #{result}\n\tEXPECTED: #{expected}"
  end
end

test.(fn -> is_function(formatter.("$")) end, true, "formatter should return a function")
test.(fn -> formatter.("$").(0) end, "0", "0 should be formatted as \"0\"")
test.(fn -> formatter.("€").(125) end, "€ 125", "€ formatter should print 125 formatted as \"€ 125\"")
test.(fn -> formatter.("$").(-1125) end, "($ 1125)", "$ formatter should print -1125 formatted as \"($ 1125)\"")
