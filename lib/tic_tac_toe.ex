defmodule TicTacToe do
  def new do
    {:ok, game} = Agent.start(fn ->
      %{
        0 => %{0 => nil, 1 => nil, 2 => nil},
        1 => %{0 => nil, 1 => nil, 2 => nil},
        2 => %{0 => nil, 1 => nil, 2 => nil}
      }
    end)
    game
  end
  def make_move(game, player, {x, y}) do
    Agent.update(game, fn board ->
      put_in board[x][y], String.downcase(player)
    end)
  end

  @doc """
    @param game is a PID
  """
  def get_board(game) do # game is a PID
    Agent.get(game, &(&1))
  end
end
