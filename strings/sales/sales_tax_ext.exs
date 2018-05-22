defmodule BookStore.SalesTax do
  alias __MODULE__

  def fetch_data() do
    file = File.open!("sales_info.csv", [:read, :utf8]) #open file for reading
    headers = extract_header(IO.read(file, :line)) #isolate the header row
    extract_rows(headers, file) # process the rest of the rows
  end

  # process header data from csv
  defp extract_header(data) do
    String.split(data, ",") # split the string
    |> Enum.map(&(String.trim(&1))) # remove '\n'
    |> Enum.map(&(String.to_atom(&1))) # convert to atom
  end

  # read and process each row from the file 1 at a time
  defp extract_rows(headers, file) do
    Enum.map IO.stream(file, :line), fn(row) ->
      process_row(headers, row)
    end
  end

  defp process_row(headers, data) do
    values = String.split(data, ",") # split row
    |> Enum.map(&(String.trim(&1))) # remove '\n'
    |> Enum.map(&(extract_value(&1))) # convert based on datatype
    Enum.zip(headers, values) #compact into keyword list so that each row has the corresponding header(key) and value
  end

  defp extract_value(s) do
    # make sure the string being processed is a float/number else convert to atom
    case Float.parse(s) do
      {num, _}  -> num
      :error    -> String.to_atom(String.trim(s, ":"))
    end
  end
end

defmodule Store do
  def calc(t, o) when is_list(t) and is_list(o) do
    do_calc(t, o)
  end

  defp do_calc(taxes, orders) do
    for order <- orders do
      total = if Keyword.has_key?(taxes, order[:ship_to]) do
        Float.round(order[:net_amount] * (1 + taxes[order[:ship_to]]), 2)
      else
        order[:net_amount]
      end
      order ++ [total_amount: total]
    end
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = BookStore.SalesTax.fetch_data()

IO.inspect(Enum.sort(Store.calc(tax_rates, orders)))
