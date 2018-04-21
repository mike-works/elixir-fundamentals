defmodule Deck do
  @cards for number <- ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"],
    suit <- ["H", "C", "D", "S"],
    do: [number, suit]


  def get_cards(num) when num > 0 do
    @cards
    |> Enum.take(num)
  end
end