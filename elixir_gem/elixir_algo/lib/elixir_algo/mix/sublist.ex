defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b, do: :equal

  def compare(a, b) when length(a) > length(b),
    do: if subset?(b, a), do: :superlist, else: :unequal

  def compare(a, b) when length(a) < length(b),
    do: if subset?(a, b), do: :sublist, else: :unequal

  def compare(_, _), do: :unequal

  defp subset?([], _b), do: true
  defp subset?(a, b), do: a in Enum.chunk_every(b, length(a), 1)
end
