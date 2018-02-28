defmodule TicTacToeTest do
  use ExUnit.Case
  @moduletag :exercise14

  test "Starting a game should return a PID" do
    game = TicTacToe.new
    assert is_pid(game) === true
  end

  test "Board is full of nils before game starts" do
    game = TicTacToe.new

    board_before = game |> TicTacToe.get_board
    assert board_before[1][1] === nil
  end

  test "Making a move should change game state" do
    game = TicTacToe.new

    board_before = game |> TicTacToe.get_board
    game
    |> TicTacToe.make_move("X", {1, 1})

    board_after = game |> TicTacToe.get_board
    assert board_after[1][1] === "X"
  end


end