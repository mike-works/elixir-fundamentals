defmodule Deck do
  
  def get_cards(num) when num > 0 do
    nums = 1..10
    |> Enum.to_list
    |> Kernel.++(["J", "Q", "K"])
    
    cards = for n <- nums,
                s <- ["C", "D", "H", "S"] do
      "#{n}#{s}"
    end
    
    cards
    |> Enum.shuffle
    |> Enum.take(num)
  end
end