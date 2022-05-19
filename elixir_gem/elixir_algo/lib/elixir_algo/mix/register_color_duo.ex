defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @chart %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9
  }
  def colors do
    Map.to_list(@chart)
    |> Enum.sort(fn {_, x1}, {_, x2} -> x1 < x2 end)
    |> Enum.map(fn {color, _} -> color end)
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    Map.get(@chart, color)
  end
end
