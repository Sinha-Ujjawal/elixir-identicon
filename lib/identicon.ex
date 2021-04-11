defmodule Identicon do
  def create(str) do
    str
    |> hash_str()
  end

  @doc """
    Converts the given string to a "unique" list of integers

    ## Examples

        iex> Identicon.hash_str("apple")
        [31, 56, 112, 190, 39, 79, 108, 73, 179, 227, 26, 12, 103, 40, 149, 127]
        iex> Identicon.hash_str("ball")
        [122, 16, 234, 27, 155, 40, 114, 218, 159, 55, 80, 2, 196, 77, 223, 206]
  """
  @spec hash_str(str :: charlist()) :: list(integer())
  def hash_str(str) do
    :crypto.hash(:md5, str)
    |> :binary.bin_to_list()
  end
end
