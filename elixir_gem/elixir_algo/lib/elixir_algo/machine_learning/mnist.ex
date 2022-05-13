defmodule Mnist do
  import Nx.Defn
  def load()do
    b = File.read!("/Users/siddhant/downloads/train-images-idx3-ubyte.gz") |> :zlib.gunzip()
    <<_::32, n_images::32, n_rows::32, n_col::32, images::binary>> = b

    heatmap =
      images
      |> Nx.from_binary({:u, 8})
      |> Nx.reshape({n_images, n_rows, n_col})
      |> Nx.to_heatmap

    images =
      images
      |> Nx.from_binary({:u, 8})
      |> Nx.reshape({n_images, n_rows * n_col}, names: [:batch, :input])
      |> Nx.divide(255)
      |> Nx.to_batched_list(30)
  end

  def load_test() do
    b = File.read!("/Users/siddhant/downloads/t10k-labels-idx1-ubyte.gz") |> :zlib.gunzip()
    <<_::32, n_labels::32, labels::binary>> = b
    IO.inspect(n_labels)

    labels =
      labels
      |> Nx.from_binary({:u, 8})
      |> Nx.reshape({n_labels, 1}, names: [:batch, :output])
      |> Nx.equal(Nx.tensor(Enum.to_list(0..9)))
      |> Nx.to_batched_list(30)
  end

  defn softmax(t) do
    Nx.exp(t) / Nx.sum(Nx.exp(t))
  end
end
