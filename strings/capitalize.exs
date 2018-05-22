defmodule Capitalize do

  # One liner :)
  def cap(str) do
    Enum.join((for s <- String.split(str, ". "), do: String.capitalize(s)), ". ")
  end

end
