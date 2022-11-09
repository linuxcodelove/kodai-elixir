defmodule KodaiAdmin.Account.Auth do
  alias KodaiAdmin.Account

  def authenticate(username, password) do
    user = Account.get_user_by_username(username)

    case check_password(user, password) do
      false -> {:error, "invalid username or password"}
      true -> {:ok, user}
    end
  end

  defp check_password(nil, _), do: false

  defp check_password(user, password) do
    Bcrypt.verify_pass(password, user.password_hash)
  end
end
