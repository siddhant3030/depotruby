defmodule ElixirAlgoWeb.PageController do
  use ElixirAlgoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
