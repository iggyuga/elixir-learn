defmodule MyList do
  def max([]), do: []
  def max([list]), do: list
  def max([head, tail]) when head > tail, do: head
  def max([_, tail]), do: tail
  def max([head|tail]), do: max([head, max(tail)])
end
