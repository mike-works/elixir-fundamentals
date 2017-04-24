defmodule CreditCard do
  defstruct type: "", expire_year: nil
  @valid_types ["visa", "mastercard", "amex"]

  def process(%CreditCard{type: type, expire_year: yr}) when (type in @valid_types) and (yr >= 2017) do
    "OK!"
  end
end