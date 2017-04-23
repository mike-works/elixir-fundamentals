struct_info = CreditCard.module_info(:exports)
|> Keyword.get_values(:__struct__)
|> length
cond do
  struct_info > 0 ->
    defmodule CreditCardTest do
      use ExUnit.Case
      @moduletag :exercise5

      test "passing a regular map (not a struct) to CreditCard.process should fail" do
        assert_raise(FunctionClauseError, fn ->
          CreditCard.process(%{type: "visa", expire_year: 2021})
        end)
      end

      test "passing a card with type: \"discover\" to CreditCard.process should fail" do
        assert_raise(FunctionClauseError, fn ->
          CreditCard.process(%CreditCard{type: "discover"})
        end)
      end

      test "passing a card with type: \"visa\" that expires in 2021 to CreditCard.process should be ok" do
        assert "OK!" === %CreditCard{
          type: "visa",
          expire_year: 2021
        }
        |> CreditCard.process
      end

      test "passing a card that expired in 2015 to CreditCard.process should fail" do
        assert_raise(FunctionClauseError, fn ->
          CreditCard.process(%CreditCard{expire_year: 2015, type: "visa"})
        end)
      end
    end
  true ->
    defmodule CreditCardTest do
      use ExUnit.Case
      @moduletag :exercise5
    end
end