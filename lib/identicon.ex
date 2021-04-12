defmodule Identicon do
  def create(str) do
    str
    |> hash_str()
    |> Identicon.Image.with_hex()
    |> pick_color()
    |> make_grid()
  end

  @doc """
    Updates `grid` field of `Identicon.Image` struct.
    Use `hex` field to create the `grid`

    ## Examples

        iex> Identicon.make_grid(%Identicon.Image{hex: [1, 2, 3, 4]})
        %Identicon.Image{hex: [1, 2, 3, 4], grid: [[1, 2, 3, 2, 1]]}
        iex> Identicon.make_grid(%Identicon.Image{hex: [1, 2, 3, 4, 5, 6]})
        %Identicon.Image{hex: [1, 2, 3, 4, 5, 6], grid: [[1, 2, 3, 2, 1], [4, 5, 6, 5, 4]]}
        iex> Identicon.make_grid(%Identicon.Image{hex: [1, 2, 3, 4, 5, 6, 7, 8]})
        %Identicon.Image{hex: [1, 2, 3, 4, 5, 6, 7, 8], grid: [[1, 2, 3, 2, 1], [4, 5, 6, 5, 4]]}
        iex> Identicon.make_grid(%Identicon.Image{hex: [1, 2, 3, 4, 5, 6, 7, 8, 9]})
        %Identicon.Image{hex: [1, 2, 3, 4, 5, 6, 7, 8, 9], grid: [[1, 2, 3, 2, 1], [4, 5, 6, 5, 4], [7, 8, 9, 8, 7]]}
  """
  @spec make_grid(image :: Identicon.Image.t()) :: Identicon.Image.t()
  def make_grid(image = %Identicon.Image{hex: hex}) do
    image
    |> Identicon.Image.with_grid(
      Enum.chunk_every(hex, 3, 3, :discard)
      |> Enum.map(fn xs = [x0, x1, _] -> xs ++ [x1, x0] end)
    )
  end

  @doc """
    Updates `color` field of `Identicon.Image` struct.
    Uses first 3 values of the `hex` field for `color`

    ## Examples

        iex> Identicon.pick_color(%Identicon.Image{hex: [1, 2, 3, 4]})
        %Identicon.Image{hex: [1, 2, 3, 4], color: {1, 2, 3}}
  """
  @spec pick_color(image :: Identicon.Image.t()) :: Identicon.Image.t()
  def pick_color(image = %Identicon.Image{hex: [r, g, b | _]}) when length(image.hex) >= 3 do
    image |> Identicon.Image.with_color({r, g, b})
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
    :crypto.hash(:md5, str) |> :binary.bin_to_list()
  end
end
