# First, we need to figure out a way to individually group all the character combinations of each title. Suppose the content library contains the following titles:
# "duel", "dule", "speed", "spede", "deul", "cars". How would you efficiently implement a functionality so that if a user misspells speed as spede, they are shown the correct title?

# We want to split the list of titles into sets of words so that all words in a set are anagrams. In the above list, there are three sets:
#  {"duel", "dule", "deul"}, {"speed", "spede"}, and {"cars"}. Search results should comprise all members of the set that the search string is found in.
#  We should pre-compute these sets instead of forming them when the user searches a title.
alias :array, as: Arrays
defmodule GroupTitles do
  def group_titles(strs) do
    strs
    |> Enum.reduce(Map.new(), fn s, acc ->
      count = Arrays.new(List.duplicate(0, 26))
      key =
        s
        |> String.graphemes()
        |> Enum.reduce(count, fn <<c::utf8>>, acc ->
          index = c - ?a
          Arrays.replace(acc, index, acc[index]+1)
        end)
        |> Arrays.to_list
        |> List.to_tuple

      Map.update(acc, key, [s], fn list -> list ++ [s] end)
    end)
    |> Map.values
  end
end
