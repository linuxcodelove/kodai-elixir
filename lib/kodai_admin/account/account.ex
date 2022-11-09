defmodule KodaiAdmin.Account do
  alias KodaiAdmin.Repo
  alias KodaiAdmin.Account.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_user!(id), do: Repo.get!(User, id)
  def get_user_by_username(username), do: Repo.get_by(User, username: username)

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def list_users, do: Repo.all(User)
end
