defmodule ElixirAlgo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirAlgoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirAlgo.PubSub},
      # Start the Endpoint (http/https)
      ElixirAlgoWeb.Endpoint
      # Start a worker by calling: ElixirAlgo.Worker.start_link(arg)
      # {ElixirAlgo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirAlgo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirAlgoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
