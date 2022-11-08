defmodule KodaiAdmin.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias KodaiAdmin.Account.User

  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field(:username, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
  end

  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:name, :password])
    |> validate_confirmation(:password, message: "does not match password")
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(changeset) do
    if password = get_change(changeset, :password) do
      put_change(changeset, :password_hash, hashpwsalt(password))
    else
      changeset
    end
  end
end
