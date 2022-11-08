import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :kodai_admin, KodaiAdmin.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "kodai_admin_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kodai_admin, KodaiAdminWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MCt3H0912qhvalLW2yn5twoZUR3IL5f+0x0pTxQ6Ytq/gq1gAiBi6mwG9WCKXtml",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
