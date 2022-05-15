defmodule TopMovies do
  def mergeK_country(lists) when length(lists) <= 0, do: nil
  # Main function
  def mergeK_country(lists) do
    [res | lists] = lists

    lists
    |> Enum.reduce(res, fn lst2, res ->
      merge2_country(res, lst2)
    end)
  end

  def merge2_country(l1, l2) when l1 == nil, do: l2
  def merge2_country(l1, l2) when l2 == nil, do: l1

  def merge2_country(l1, l2) do
    case {l1.data, l2.data} do
      {first, second} when first <= second ->
        %{l1 | next: merge2_country(l1.next, l2)}

      _ ->
        %{l2 | next: merge2_country(l1, l2.next)}
    end
  end
end

# Driver code
defmodule Main do
  def main do
    IO.puts("-----------------------------")
    IO.puts("PROGRAM OUTPUT:")

    a = LinkedList.create_linked_list([11, 41, 51])
    b = LinkedList.create_linked_list([21, 23, 42])
    c = LinkedList.create_linked_list([25, 56, 66, 72])

    IO.puts("All movie ID's from best to worse are:")
    TopMovies.mergeK_country([a, b, c]) |> LinkedList.display()
  end
end
