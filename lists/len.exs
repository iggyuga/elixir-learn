defmodule MyList do
  def len([]), do: 0
  # The underscore is a placeholder that gets ignored by the compiler
  def len([_head|tail]), do: 1 + len(tail)
end
