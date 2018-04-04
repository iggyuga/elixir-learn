
defmodule MyList do
  def sum(list), do: _sum(list, 0)
  # Here it is a bit tacky to pass in the 0 also known as the accumlator
  # this invariant keeps track of the subtotal as the list gets emptied
  # the underscore is seen as independent in elixir but explicit to the reader
  defp _sum([], total), do: total
  defp _sum([head|tail], total), do: _sum(tail, head+total)
end
