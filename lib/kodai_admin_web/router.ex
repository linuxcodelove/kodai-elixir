defmodule KodaiAdminWeb.Router do
  use KodaiAdminWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KodaiAdminWeb do
    pipe_through :api
  end
end
