defmodule KodaiAdmin.Guardian do
  use Guardian, otp_app: :kodai_admin
  alias KodaiAdmin.Account

  def subject_for_token(user, _claims) do
    sub = "user:#{user.id}"
    {:ok, sub}
  end

  def subject_for_token(_resource, _claims), do: {:error, :no_subject}

  def resource_from_claims(%{"sub" => "user:" <> user_id}) do
    resource = Account.get_user!(user_id)
    {:ok, resource}
  end

  def resource_from_claims(_claims), do: {:error, :invalid_token}
end
