defmodule Meetings do
  def merge_meetings(merge_meetings) do
    merge_meetings = Enum.sort(merge_meetings)
    merged = Arrays.new([])

    merge_meetings
    |> Enum.reduce(merged, fn([meeting_0, meeting_1], merged) ->
      cond do
        Arrays.size(merged) == 0 or Arrays.new(merged[-1])[1] < meeting_0 ->
          merged |> Arrays.append([meeting_0, meeting_1])

        true ->
          max_value = max(Arrays.new(merged[-1])[1], meeting_1)
          Arrays.replace(merged, -1, [Arrays.new(merged[-1])[0], max_value])
      end
    end)
    |> Arrays.to_list
  end
end
