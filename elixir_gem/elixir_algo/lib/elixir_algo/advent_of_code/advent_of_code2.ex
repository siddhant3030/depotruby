defmodule AdventOfCode do
  def solve do
    input = """
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
    """

    # |> Enum.map(fn
    #   "forward " <> number -> {:forward, String.to_integer(number)}
    #   "down " <> number -> {:forward, String.to_integer(number)}
    #   "up " <> number -> {:forward, String.to_integer(number)}
    # end)

    input
    |> String.split("\n", trim: true)
    # |> Enum.map(fn
    #   "forward " <> number -> {:forward, String.to_integer(number)}
    #   "down " <> number -> {:down, String.to_integer(number)}
    #   "up " <> number -> {:up, String.to_integer(number)}
    # end)
    |> Enum.reduce({_depth = 0, _position = 0}, fn
      "forward " <> number, {depth, position} ->
        {depth, String.to_integer(number) + position}

      "down " <> number, {depth, position} ->
        {String.to_integer(number) + depth, position}

      "up " <> number, {depth, position} ->
        {-String.to_integer(number) + depth, position}
    end)

    |> then(fn {depth, position} -> depth * position end)
  end
end
