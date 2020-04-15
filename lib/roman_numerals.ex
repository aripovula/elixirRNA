defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    digits = [
      ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],
      ["","X","XX","XXX","XL","L", "LX","LXX","LXXX","XC"],
      ["","C","CC","CCC","CD","D", "DC","DCC","DCCC","CM"],
      ["", "M", "MM", "MMM"]
    ]
    to_string(number)
    |> String.reverse
    |> String.graphemes
    |> Enum.with_index
    |> Enum.reduce "", fn (i, acc) ->
      {nextInt, x} = i
      { ind, _ } = Integer.parse(nextInt)
       Enum.at(Enum.at(digits, x), ind) <> acc
    end
  end
end
