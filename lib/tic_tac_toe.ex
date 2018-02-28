defmodule TicTacToe do
  def new do
    case Agent.start fn ->
      %{
        0 => %{0 => nil, 1 => nil, 2 => nil},
        1 => %{0 => nil, 1 => nil, 2 => nil},
        2 => %{0 => nil, 1 => nil, 2 => nil}
       }
    end do
      {:ok, game_pid} -> game_pid
      _ -> raise "Problem starting agent"
    end
  end
  def make_move(game, player, {x, y}) do
    Agent.update game, fn board -> 
      put_in(board,[x,y], player)
    end, 500
  end
  def get_board(game) do
    Agent.get game, &(&1)
  end
end
