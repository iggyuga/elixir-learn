defmodule ASCII do
  def check(str) do
    do_check(str)
  end

  defp do_check([]), do: true
  defp do_check(str) when is_list(str), do: Enum.all?(str, fn ch -> ch in ?\s..?~ end)
  defp do_check(_), do: false

end
