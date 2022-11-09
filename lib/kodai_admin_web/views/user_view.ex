defmodule KodaiAdminWeb.UserView do
  use KodaiAdminWeb, :view
  def render("index.json", %{users: users}), do: render_many(users, __MODULE__, "users.json")

  def render("users.json", %{user: user}),
    do: %{
      user_name: user.username,
      password: user.password_hash
    }
end
