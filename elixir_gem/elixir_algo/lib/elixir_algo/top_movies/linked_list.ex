defmodule LinkedListNode do
  defstruct data: nil, next: nil, prev: nil, arbitrary: nil
  def init(data), do:  %LinkedListNode{data: data}
end

defmodule LinkedList do
  def insert_at_head(head, data) do
    new_node = LinkedListNode.init(data)
    %LinkedListNode{new_node | next: head}
  end

  def insert_at_tail(nil, node), do: node
  def insert_at_tail(%LinkedListNode{next: next} = head, node) do
    temp = head
    if next != nil do
        %{temp | next: insert_at_tail(next, node)}
    else
        %{temp | next: node}
    end
  end

  def create_linked_list(lst) do
    list_head = nil
    :lists.reverse(lst)
    |> Enum.reduce(list_head, fn (x, list_head) ->
      insert_at_head(list_head, x)
    end)
  end

  def create_random_list(length) do
    list_head = nil
    0..length-1
    |> Enum.reduce(list_head, fn (_i, list_head) ->
      insert_at_head(list_head, :rand.uniform(100))
    end)
  end

  def display(nil), do: IO.write("")
  def display(head) do
    temp = head
    IO.write(to_string(temp.data))
    temp = temp.next
    case temp do
      nil -> display(temp)
      _ -> (IO.write(", "); display(temp))
    end
  end

  def to_list(nil, lst), do: lst
  def to_list(temp, lst) do
    lst = [temp.data | lst]
    to_list(temp.next, lst)
  end

  def to_list(head) do
    lst = []
    temp = head
    to_list(temp, lst) |> :lists.reverse
  end

  def is_equal(list1, list2) when list1 == list2, do: true
  def is_equal(list1, list2) when list1 == nil, do: list1 == list2
  def is_equal(list1, list2) when list2 == nil, do: list1 == list2
  def is_equal(list1, list2) do
    if list1.data != list2.data, do: false, else: is_equal(list1.next, list2.next)
  end
end
