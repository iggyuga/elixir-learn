defmodule MyList do
  # In this version of sum() we are rewriting the functionality without
  # using an accumulator, we simply recursively keep summing without keeping track
  def sum(list), do: _sum(list)

  defp _sum([]), do: 0
  defp _sum([head|tail]), do: head + _sum(tail)

end
