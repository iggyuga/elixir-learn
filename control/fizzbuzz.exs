defmodule FizzBuzz do
  # good ol' FizzBuzz, naive approach

  # entry function, gaurd clauses
  def upto(n) when n > 0, do: _upto(1, n, [])

  # wrap-up function, as we build up our result, because of recursive nature we must reverse the final result
  defp _upto(_current, 0, result), do: Enum.reverse(result)

  # main body of work, checks for multiples of 3, 5, both or neither
  defp _upto(current, left, result) do
    next_answer =
      cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 -> "FizzBuzz"
        rem(current, 3) == 0 -> "Fizz"
        rem(current, 5) == 0 -> "Buzz"
        true -> current
      end
    _upto(current+1, left-1, [ next_answer | result ])
    end
end
