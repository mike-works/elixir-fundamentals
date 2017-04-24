defmodule DeckTest do
  use ExUnit.Case
  @moduletag :exercise11

  test "Deck.get_cards(5) should return five cards" do
    assert length(Deck.get_cards(5)) === 5
  end

  test "Deck.get_cards(3) should return five cards" do
    assert length(Deck.get_cards(3)) === 3
  end

  test "Deck.get_cards(99) should return 52 cards" do
    assert length(Deck.get_cards(99)) === 52
  end

  test "Cards should be two characters long" do
    [card|_] = Deck.get_cards(1)
    assert String.length(card) === 2
  end
  test "Cards should begin with a card type, and end with a suit" do
    [card|_] = Deck.get_cards(1)
    Regex.match?(~r/[CDSH]{1}[1-90JQKA]{1}$/, card)
  end

end