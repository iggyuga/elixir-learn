#This module simulates a few of the functions of the Enum module, namely, all?, each, filter, split, take

defmodule MyEnum do

  #This function simulates the Enum.all? functionaility. We take in a list and a function to evalutate on. If any point the expression yield false, return false, otherwise keep checking the expression against each item in the list.

  def all?(list, condition) when is_list(list) and is_function(condition) do
    do_all(list,condition)
  end

  defp do_all([head | tail ], condition) do
    case condition.(head) do
      true -> do_all(tail, condition)
      false -> false
    end
  end

  defp do_all([], _condition), do: true

  #This function simulates the Enum.each functionality. We take in a list and a function to evaluate on. Then invoke the function on each element in the list recursively

  def each(list, func) when is_list(list) and is_function(func) do
    do_each(list, func)
  end

  defp do_each([ head | tail ], func) do
    func.(head)
    do_each(tail, func)
  end

  defp do_each([], _func), do: :ok

  #This function simulates the Enum.filter functionality. We take in a list and a condition to check each element on. If the condition is true we add it to our accumulator list and continue recursively checking the rest of the elements in the list. If the condition is false, we essentially skip adding the element to the list and continue recursively checking the rest of the elements in the list.

  def filter(list, condition) when is_list(list) and is_function(condition) do
    do_filter(list, condition, [])
  end

  defp filter([ head | tail ], condition, acc) do
    case condition.(head) do
      true -> do_filter(tail, condition, [ head | acc ])
      false -> do_filter(tail, condition, acc)
    end
  end

  defp do_filter([], _condition, acc), do: acc


  #This function simulates the Enum.split functionality. We take in a list and element to split the list on. Example below shows what is happening.

  # split([3,4,5,6,7], 5)
  # under the hood
  # do_split([3,4,5,6,7], 5, [])
  # false
  # do_split([4,5,6,7], 5, [3])
  # false
  # do_split([5,6,7], 5, [4,3])
  # true
  # { Enum.reverse([5,4,3], [6,7]) } yields, { [3,4,5], [6,7] }

  def split(list, split_on) when is_list(list) do
    do_split(list, split_on, [])
  end

  defp do_split([ head | tail ], split_on, acc) do
    case head == split_on do
      true -> { Enum.reverse([ head | acc ]), tail }
      false -> do_split(tail, split_on, [head | acc])
    end
  end

  defp do_split([], _split_on, acc), do: { Enum.reverse(acc), []}


  # This function simulates the Enum.take functionality. We take in a list and static number to extract the number of elements from the list and put them in a new list to be returned. Since there is no index involved in this implementation we are simply 'taking' from the head of the list until we've exhausted our static number to extract from.

  def take(list, n) when is_list(list) and is_number(n) and n > 0 do
    do_take(list, n, [])
  end

  defp do_take([ head | tail ], n, acc) when n > 0 do
    do_take(tail, n - 1, [ head | acc] )
  end

  defp do_take(_list, n, acc) when n == 0, do: Enum.reverse(acc)

  defp do_take([], _, acc), do: Enum.reverse(acc)

end
