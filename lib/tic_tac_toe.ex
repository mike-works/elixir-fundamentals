defmodule TicTacToe do
  def new do
    {:ok, pid} = Agent.start(fn -> 
      %{
        0 => %{0 => nil, 1 => nil, 2 => nil},
        1 => %{0 => nil, 1 => nil, 2 => nil},
        2 => %{0 => nil, 1 => nil, 2 => nil}
      }
    end)
    pid
  end

  def make_move(game, player, {x, y}) do
   Agent.update(game, fn current_board ->
    put_in(current_board[x][y], player)
   end)
  end

  def get_board(game) do
    Agent.get(game, &(&1))
  end
end
