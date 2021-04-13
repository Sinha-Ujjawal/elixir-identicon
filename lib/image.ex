defmodule Identicon.Image do
  defstruct color: nil, hex: nil, grid: nil, pixel_map: nil
  @type color :: {integer(), integer(), integer()}
  @type hex :: list(integer())
  @type grid :: list({integer(), integer()})
  @type pixel_map :: list({{integer(), integer()}, {integer(), integer()}})
  @type t :: %Identicon.Image{
          color: color() | nil,
          hex: hex() | nil,
          grid: grid() | nil,
          pixel_map: pixel_map() | nil
        }

  @doc """
    Constructor function for struct `Indenticon.Image`

    ## Examples

        iex> Identicon.Image.empty
        %Identicon.Image{color: nil, hex: nil}
  """
  @spec empty() :: t()
  def empty do
    %Identicon.Image{}
  end

  @spec with_hex(hex :: hex()) :: t()
  def with_hex(hex) do
    %Identicon.Image{hex: hex}
  end

  @doc """
    Constructor function for struct `Indenticon.Image`

    ## Examples

        iex> Identicon.Image.with_hex([1, 2, 3, 4])
        %Identicon.Image{color: nil, hex: [1, 2, 3, 4]}
        iex> empty_image = Identicon.Image.empty
        iex> empty_image |> Identicon.Image.with_hex([1, 2, 3, 4])
        %Identicon.Image{color: nil, hex: [1, 2, 3, 4]}
  """
  @spec with_hex(image :: t(), hex :: hex()) :: t()
  def with_hex(image, hex) do
    %Identicon.Image{image | hex: hex}
  end

  @spec with_color(color :: color()) :: t()
  def with_color(color) do
    %Identicon.Image{color: color}
  end

  @doc """
    Constructor function for struct `Indenticon.Image`

    ## Examples

        iex> Identicon.Image.with_color({100, 200, 255})
        %Identicon.Image{color: {100, 200, 255}, hex: nil}
        iex> empty_image = Identicon.Image.empty
        iex> empty_image |> Identicon.Image.with_color({100, 200, 255})
        %Identicon.Image{color: {100, 200, 255}, hex: nil}
  """
  @spec with_color(image :: t(), color :: color()) :: t()
  def with_color(image, color) do
    %Identicon.Image{image | color: color}
  end

  @spec with_grid(grid :: grid()) :: t()
  def with_grid(grid) do
    %Identicon.Image{grid: grid}
  end

  @doc """
    Constructor function for struct `Indenticon.Image`

    ## Examples

        iex> Identicon.Image.with_grid([[1, 2, 3, 4], [5, 6, 7, 8]])
        %Identicon.Image{grid: [[1, 2, 3, 4], [5, 6, 7, 8]], hex: nil}
        iex> empty_image = Identicon.Image.empty
        iex> empty_image |> Identicon.Image.with_grid([[1, 2, 3, 4], [5, 6, 7, 8]])
        %Identicon.Image{grid: [[1, 2, 3, 4], [5, 6, 7, 8]], hex: nil}
  """
  @spec with_grid(image :: t(), grid :: grid()) :: t()
  def with_grid(image, grid) do
    %Identicon.Image{image | grid: grid}
  end

  @spec with_pixel_map(pixel_map :: pixel_map()) :: t()
  def with_pixel_map(pixel_map) do
    %Identicon.Image{pixel_map: pixel_map}
  end

  @doc """
    Constructor function for struct `Indenticon.Image`

    ## Examples

        iex> Identicon.Image.with_pixel_map([{{100, 0}, {0, 400}}, {{120, 5}, {7, 300}}])
        %Identicon.Image{pixel_map: [{{100, 0}, {0, 400}}, {{120, 5}, {7, 300}}]}
        iex> empty_image = Identicon.Image.empty
        iex> empty_image |> Identicon.Image.with_pixel_map([{{100, 0}, {0, 400}}, {{120, 5}, {7, 300}}])
        %Identicon.Image{pixel_map: [{{100, 0}, {0, 400}}, {{120, 5}, {7, 300}}]}
  """
  @spec with_pixel_map(image :: t(), pixel_map :: pixel_map()) :: t()
  def with_pixel_map(image, pixel_map) do
    %Identicon.Image{image | pixel_map: pixel_map}
  end
end
