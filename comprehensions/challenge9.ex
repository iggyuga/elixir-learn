defmodule Challenge9 do

  # prints every character as a list of strings
  # understanding the different bits of comprehensions in elixir
  def hello() do
    for <<c <- "hello world">>, do: <<c>>
  end

  # prints every character except 'l' (filter) as a list of strings
  def hello2() do
    for <<c <- "hello world">>, c != ?l,  do: <<c>>
  end

  # prints every character in the list of consonants, for as many times there are vowels as a list of strings
  def vowels() do
    for <<v <- "aeiou">>, <<c <- "bchdfg">>, do: <<c>>
  end

  # prints every character in the list of consonants and vowels, for as many times there are vowels as a list of strings
  def vowels2() do
    for <<v <- "aeiou">>, <<c <- "bchdfg">>, do: <<c,v>>
  end

  # prints every character in the list of consonants and vowels, for as many times there are vowels as a list of strings dumped into 1 string
  def vowels3() do
    for <<v <- "aeiou">>, <<c <- "bchdfg">>, into: "", do: <<c,v>>
  end


end
