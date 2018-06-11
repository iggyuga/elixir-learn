defmodule Challenge8 do
  #~w sigil for a list of words, no commas
  #iterates through a deck of cards and applies their suit and rank
  def deck(option \\ %{}) do
    suits = ~w(Spades Hearts Clubs Diamonds)
    ranks = rtos(2..10) ++ ~w(Jack Queen King Ace)
    for r <- ranks, s <- suits, do: r <> " of "  <> s
  end

  def rtos(r) do
    Enum.map(r, &Integer.to_string/1)
  end

end
