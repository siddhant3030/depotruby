defmodule LinkedList do
  @opaque t :: tuple()
  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    %{length: 0}
  end
  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    len = LinkedList.length(list)

    Map.put(list, len, elem)
    |> Map.put(:length, len + 1)
  end
  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list) do
    list[:length] || 0
  end
  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    LinkedList.length(list) == 0
  end
  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) do
    len = LinkedList.length(list)
    case len do
      0 -> {:error, :empty_list}
      _ -> {:ok, list[len - 1]}
    end
  end
