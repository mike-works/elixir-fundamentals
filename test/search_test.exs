defmodule SearchTest do
  use ExUnit.Case
  @moduletag :exercise12

  test "Sending Search a message should result in a message being sent back" do
    pid = spawn(Search, :start, [])
    send(pid, {self(), {:complete_me, "comp"}})
    assert_receive {pid, {:completions, _}} , 3_000
  end

  test "Sending Search a message should result in a non-empty LIST being sent back" do
    pid = spawn(Search, :start, [])
    send(pid, {self(), {:complete_me, "app"}})
    assert_receive {pid, {:completions, [head|tail]}} , 3_000
    assert length(tail) > 0
  end

  test "Sending Search repeated messages should get repeated results" do
    pid = spawn(Search, :start, [])
    
    send(pid, {self(), {:complete_me, "ruby"}})
    assert_receive {pid, {:completions, [h1|t1]}} , 3_000
    assert length(t1) > 0
    
    send(pid, {self(), {:complete_me, "elixi"}})
    assert_receive {pid, {:completions, [h2|t2]}} , 3_000
    assert length(t2) > 0
  end
end