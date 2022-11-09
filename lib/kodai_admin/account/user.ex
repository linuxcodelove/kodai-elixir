defmodule KodaiAdmin.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias KodaiAdmin.Account.User

  import Bcrypt, only: [hash_pwd_salt: 1]

  schema "users" do
    field(:username, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    timestamps()
  end

  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> hash_password()
  end

  defp hash_password(changeset) do
    if password = get_change(changeset, :password) do
      put_change(changeset, :password_hash, hash_pwd_salt(password))
    else
      changeset
    end
  end
end
