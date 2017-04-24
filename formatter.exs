
formatter = fn
  x when abs(x) >= 1_000_000 -> "#{x/1_000_000}M"
  x when abs(x) >= 1_000 and abs(x) < 1_000_000 -> "#{x/1000}K"
  x when abs(x) < 1000 -> "#{x}" 
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

test.(fn -> formatter.(0) end, "0", "0 should be formatted as \"0\"")
test.(fn -> formatter.(99) end, "99", "99 should be formatted as \"99\"")
test.(fn -> formatter.(1000) end, "1.0K", "1000 should be formatted as \"1.0K\"")
test.(fn -> formatter.(-1300) end, "-1.3K", "-1300 should be formatted as \"-1.3K\"")
test.(fn -> formatter.(1800) end, "1.8K", "1800 should be formatted as \"1.8K\"")
test.(fn -> formatter.(7_200_000) end, "7.2M", "72000000 should be formatted as \"7.2M\"")
