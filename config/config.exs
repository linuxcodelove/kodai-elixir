# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :kodai_admin,
  ecto_repos: [KodaiAdmin.Repo]

# Configures the endpoint
config :kodai_admin, KodaiAdminWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: KodaiAdminWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: KodaiAdmin.PubSub,
  live_view: [signing_salt: "qBiZiNyq"]

# Configures the guardian
config :kodai_admin, KodaiAdmin.Guardian,
  issuer: "kodai_admin",
  secret_key: "6QH6kxkDb72uF+51Hquoka/V4ONck9cOGowUEXg0TXtnLuunBfjTiSkc77WHrEJf"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
