defmodule KodaiAdminWeb.SessionView do
  use KodaiAdminWeb, :view
  def render("success.json", %{token: token}), do: %{result: "success", token: token}
  def render("failure.json", _params), do: %{result: "failure"}
end
