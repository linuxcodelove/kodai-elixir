defmodule KodaiAdminWeb.Router do
  use KodaiAdminWeb, :router

  pipeline :api do
    plug(CORSPlug, origins: "*")
    plug :accepts, ["json"]
  end

  scope "/api", KodaiAdminWeb do
    pipe_through :api
    get("/users/new", UserController, :new)
    get("/users", UserController, :list_users)
    # session
    post("/sessions/login", SessionController, :login)
    resources "/cottages", CottageController, except: [:new, :edit]
  end
end
