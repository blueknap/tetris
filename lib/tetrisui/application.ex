defmodule Tetrisui.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Tetrisui.Repo,
      # Start the Telemetry supervisor
      TetrisuiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tetrisui.PubSub},
      # Start the Endpoint (http/https)
      TetrisuiWeb.Endpoint
      # Start a worker by calling: Tetrisui.Worker.start_link(arg)
      # {Tetrisui.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tetrisui.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TetrisuiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
