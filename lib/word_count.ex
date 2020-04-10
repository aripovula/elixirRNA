defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.replace(sentence, ~r/[^[:alnum:]-]/u, " ")
    |> String.downcase
    |> String.split
    |> Enum.reduce %{},
      fn(x, map) ->
        Map.put(map, x, (map[x] || 0) + 1)
      end
  end
end
