defmodule KodaiAdmin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      KodaiAdmin.Repo,
      # Start the Telemetry supervisor
      KodaiAdminWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: KodaiAdmin.PubSub},
      # Start the Endpoint (http/https)
      KodaiAdminWeb.Endpoint
      # Start a worker by calling: KodaiAdmin.Worker.start_link(arg)
      # {KodaiAdmin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KodaiAdmin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KodaiAdminWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
