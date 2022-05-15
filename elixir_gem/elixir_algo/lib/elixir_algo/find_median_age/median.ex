# Our third task is building a filter that will fetch relevant content based on the age of the users for a specific country or region.
# For this, we use the median age of users and the preferred content for users that fall into that specified category.

# Because the number of users is constantly increasing on the Netflix platform,
# we need to figure out a structure or design that updates the median age of users in real-time. We will have a list that constantly receives age values,
# and we will output the median value after each new data point.

# Let’s understand this better with an illustration:

# Solution#
# We will assume that ‘x’ is the median age of a user in a list. Half of the ages in the list will be smaller than (or equal to) ‘x’, and the other half will be greater than (or equal to) ‘x’. We can divide the list into two halves: one half to store the smaller numbers (say smallList), and one half to store the larger numbers (say largeList). The median of all ages will either be the largest number in the smallList or the smallest number in the largeList. If the total number of elements is even, we know that the median will be the average of these two numbers. The best data structure for finding the smallest or largest number among a list of numbers is a Heap.

# Here is how we will implement this feature:

# First, we will store the first half of the numbers (smallList) in a Max Heap. We use a Max Heap because we want to know the largest number in the first half of the list.

# Then, we will store the second half of the numbers (largeList) in a Min Heap, because we want to know the smallest number in the second half of the list.

# We can calculate the median of the current list of numbers using the top element of the two heaps.

# Let’s look at the code for this solution below:

defmodule MedianOfAges do
  defstruct max_heap: Heap.new(), min_heap: Heap.new()
  def init, do: %__MODULE__{}

  def insert_age(obj, num) do
    obj =
      cond do
        Heap.size(obj.max_heap) == 0 or -Heap.root(obj.max_heap) >= num ->
          %__MODULE__{obj | max_heap: obj.max_heap |> Heap.push(-num)}

        true ->
          %__MODULE__{obj | min_heap: obj.min_heap |> Heap.push(num)}
      end

    cond do
      Heap.size(obj.max_heap) > Heap.size(obj.min_heap) + 1 ->
        max = obj.max_heap |> Heap.root()

        %__MODULE__{
          obj
          | max_heap: obj.max_heap |> Heap.pop(),
            min_heap: obj.min_heap |> Heap.push(-max)
        }

      Heap.size(obj.max_heap) < Heap.size(obj.min_heap) ->
        min = obj.min_heap |> Heap.root()

        %__MODULE__{
          obj
          | min_heap: obj.min_heap |> Heap.pop(),
            max_heap: obj.max_heap |> Heap.push(-min)
        }

      true ->
        obj
    end
  end

  def find_median(obj) do
    cond do
      Heap.size(obj.max_heap) == Heap.size(obj.min_heap) ->
        # we have even number of elements, take the average of middle two elements
        -Heap.root(obj.max_heap) / 2.0 + Heap.root(obj.min_heap) / 2.0

      true ->
        # because max-heap will have one more element than the min-heap
        -Heap.root(obj.max_heap) / 1.0
    end
  end
end

# Driver code
IO.puts("-----------------------------")
IO.puts("PROGRAM OUTPUT:")

median_age = MedianOfAges.init()

median_age =
  median_age
  |> MedianOfAges.insert_age(22)
  |> MedianOfAges.insert_age(35)

IO.puts("The recommended content will be for ages under: #{MedianOfAges.find_median(median_age)}")
median_age = median_age |> MedianOfAges.insert_age(30)
IO.puts("The recommended content will be for ages under: #{MedianOfAges.find_median(median_age)}")
median_age = median_age |> MedianOfAges.insert_age(25)
IO.puts("The recommended content will be for ages under: #{MedianOfAges.find_median(median_age)}")
