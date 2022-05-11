defmodule PopularityAnalysis do
  def check(first, next, _increasing, decreasing) when first > next, do: {false, decreasing}
  def check(first, next, increasing, _decreasing) when first < next, do: {increasing, false}
  def check(_first, _next, increasing, decreasing), do: {increasing, decreasing}

  def identify_titles(scores) do
    increasing = decreasing = true
    {increasing, decreasing} =
      0..Arrays.size(scores)-2
      |> Enum.reduce({increasing, decreasing}, fn(i, {increasing, decreasing}) ->
        check(scores[i], scores[i+1], increasing, decreasing)
      end)

    increasing or decreasing
  end
end

# Driver code
IO.puts "-----------------------------"
IO.puts "PROGRAM OUTPUT:"

movie_ratings = [
  Arrays.new([1,2,2,3]),
  Arrays.new([4,5,6,3,4]),
  Arrays.new([8,8,7,6,5,4,4,1]),
]

movie_ratings
|> Enum.each(fn movie_rating ->
  cond do
    PopularityAnalysis.identify_titles(movie_rating) ->
      IO.puts("Title Identified and Separated")
    true ->
      IO.puts("Title Score Fluctuating")
  end
end)
