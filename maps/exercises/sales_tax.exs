defmodule BookStore.SalesTax do
  alias __MODULE__

  def calc(t, o) when is_list(t) and is_list(o) do
    do_calc(t, o)
  end

  defp do_calc(taxes, orders) do
    for order <- orders do
      if Keyword.has_key?(taxes, order[:ship_to]) do
        total = Float.round(order[:net_amount] * (1 + taxes[order[:ship_to]]), 2)
      else
        total = order[:net_amount]
      end
      order ++ [total_amount: total]
    end
  end


end

tax_rates = [ NC: 0.075, TX: 0.08 ]

# list of orders
orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount:  35.50 ],
  [ id: 125, ship_to: :TX, net_amount:  24.00 ],
  [ id: 126, ship_to: :TX, net_amount:  44.80 ],
  [ id: 127, ship_to: :NC, net_amount:  25.00 ],
  [ id: 128, ship_to: :MA, net_amount:  10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount:  50.00 ] ]

