defmodule KodaiAdmin.Repo do
  use Ecto.Repo,
    otp_app: :kodai_admin,
    adapter: Ecto.Adapters.Postgres
end
