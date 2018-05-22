defmodule FizzBuzz do
  # good ol' FizzBuzz, using Enums

  # invoke a range of numbers over an Enum with each number passed into fizzbuzz/1; this approach is too reliant on conditionals
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end
  defp fizzbuzz(n) do
    cond do
      rem(n, 3) == 0 and rem(n, 5) == 0 -> "FizzBuzz"
      rem(n, 3) == 0 -> "Fizz"
      rem(n, 5) == 0 -> "Buzz"
      true -> n
    end
  end
end
