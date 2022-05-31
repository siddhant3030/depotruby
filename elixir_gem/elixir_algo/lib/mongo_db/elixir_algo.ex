# defmodule ElixirAlgo.CLI do
#   alias MongoFile
#   def main(args \\ []) do
#     args
#     |> parse_args()
#     |> IO.inspect
#     |> response()
#     |> IO.puts()
#   end

#   defp parse_args(args) do
#     {opts, word, _} =
#       args
#       |> OptionParser.parse(switches: [create: :string])

#     {opts, map}
#   end

#   defp response({create, word}) do
#     if opts[:create], do: MongoFile.create(word)
#   end
# end
