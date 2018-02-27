defmodule CreditCard do

  defstruct [:expire_year, :type] 
  def process(cc = %CreditCard{type: "visa", expire_year: y}) do
    {{yr, _, _}, _ } = :calendar.universal_time
    process(cc, yr)
  end
  defp process(%CreditCard{type: "visa", expire_year: y}, cy) when y >= cy, do: {:ok, "your visa is valid" }
  defp process(%CreditCard{}, _), do: {:error, "sorry we do not take your card" }
  defp process(_, _), do: {:error, "that's a napkin, not a credit card" }

end