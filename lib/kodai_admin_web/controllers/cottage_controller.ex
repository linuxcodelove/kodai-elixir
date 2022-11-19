defmodule KodaiAdminWeb.CottageController do
  use KodaiAdminWeb, :controller

  alias KodaiAdmin.Data
  alias KodaiAdmin.Data.Cottage

  action_fallback KodaiAdminWeb.FallbackController

  def index(conn, _params) do
    cottages = Data.list_cottages()
    render(conn, "index.json", cottages: cottages)
  end

  def create(conn, cottage_params) do
    with {:ok, %Cottage{} = cottage} <- Data.create_cottage(cottage_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.cottage_path(conn, :show, cottage))
      |> render("show.json", cottage: cottage)
    end
  end

  def show(conn, %{"id" => id}) do
    cottage = Data.get_cottage!(id)
    render(conn, "show.json", cottage: cottage)
  end

  def update(conn, %{"id" => id, "cottage" => cottage_params}) do
    cottage = Data.get_cottage!(id)

    with {:ok, %Cottage{} = cottage} <- Data.update_cottage(cottage, cottage_params) do
      render(conn, "show.json", cottage: cottage)
    end
  end

  def delete(conn, %{"id" => id}) do
    cottage = Data.get_cottage!(id)

    with {:ok, %Cottage{}} <- Data.delete_cottage(cottage) do
      send_resp(conn, :no_content, "")
    end
  end
end
