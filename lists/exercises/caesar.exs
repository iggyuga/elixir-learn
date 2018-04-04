defmodule MyList do
  # This ceasar cipher uses the underlying codepoints;
  # binary equivalents to create the cipher, lower cased
  # ex: MyList.caesar('ryvkve', 13)
  def caesar([], _n), do: []
  def caesar([head | tail], n) when head + n > 122, do: [ (head + n) - 26 | caesar(tail, n) ]
  def caesar([head | tail], n), do: [ head + n | caesar(tail, n) ]
end
