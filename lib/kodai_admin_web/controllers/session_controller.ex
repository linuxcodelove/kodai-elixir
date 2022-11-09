defmodule KodaiAdminWeb.SessionController do
  use KodaiAdminWeb, :controller
  alias KodaiAdmin.Account.Auth

  def login(conn, %{"username" => username, "password" => password}) do
    case Auth.authenticate(username, password) do
      {:ok, user} ->
        conn = KodaiAdmin.Guardian.Plug.sign_in(conn, user)
        render(conn, "success.json", %{token: KodaiAdmin.Guardian.Plug.current_token(conn)})

      _ ->
        render(conn, "failure.json", %{})
    end
  end
end
