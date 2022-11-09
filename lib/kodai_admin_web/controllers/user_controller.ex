defmodule KodaiAdminWeb.UserController do
  use KodaiAdminWeb, :controller
  alias KodaiAdmin.{Account, Account.User}

  def new(conn, _params) do
    changeset = Account.change_user(%User{})
    render(conn, "index.json", changeset: changeset)
  end

  def list_users(conn, _params) do
    users = Account.list_users()
    render(conn, "index.json", users: users)
  end
end
