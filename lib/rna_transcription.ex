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
        # dd = if String.length(to_string(x)) > 0, do: get_rna(x), else: ''
        # acc <> if String.length(to_string(x)) > 0, do: get_rna(x), else: ""
        # Logger.debug inspect(["dd-",dd])
        Logger.debug inspect(["acc-",acc ])
        acc ++ get_rna(to_charlist(x))
        end
    end
  end

  @spec get_rna([char]) :: [char]
  def get_rna(dna) do
    # Logger.debug inspect(["get_rna acc-",acc])
    # Logger.debug inspect(["get_rna d-",d])

    # dna = if is_binary(d), do: to_charlist(d), else: d
    Logger.debug inspect(["get_rna dna-", dna])

    # x = if false, do: 1, else: 2

    case dna do
      'G' -> 'C'
      'C' -> 'G'
      'T' -> 'A'
      'A' -> 'U'
      _ -> ''
    end

  end
end
