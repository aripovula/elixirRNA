require Logger
defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    d = to_string dna
    l = String.length(d)
    cond do
      l == 1 -> get_rna(dna)
      l > 1 -> Enum.reduce String.split(d, ""), '', fn(x, acc) ->
        acc ++ get_rna(to_charlist(x))
        end
    end
  end

  @spec get_rna([char]) :: [char]
  def get_rna(dna) do
    case dna do
      'G' -> 'C'
      'C' -> 'G'
      'T' -> 'A'
      'A' -> 'U'
      _ -> ''
    end
  end
end
