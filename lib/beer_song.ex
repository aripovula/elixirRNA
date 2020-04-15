defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    s1 = number > 1 && "s" || ""
    s2 = ( number - 1 ) > 0 && number - 1 || "no more"
    s3 = (number - 1) == 1 && "" || "s"
    t = number > 1 && "one" || "it"

    cond do
      number > 0 ->
    """
             #{number} bottle#{s1} of beer on the wall, #{number} bottle#{s1} of beer.
             Take #{t} down and pass it around, #{s2} bottle#{s3} of beer on the wall.
             """
      number == 0 ->
        """
             No more bottles of beer on the wall, no more bottles of beer.
             Go to the store and buy some more, 99 bottles of beer on the wall.
             """
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics() :: String.t()
  def lyrics() do
    lyrics(99..0)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    range
    |> Enum.reduce "", fn (i, acc) ->
      lb = String.length(acc) > 0 && "\n" || ""
      acc <> lb <> verse(i)
    end
  end
end
