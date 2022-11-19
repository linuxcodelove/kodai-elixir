defmodule KodaiAdminWeb.CottageControllerTest do
  use KodaiAdminWeb.ConnCase

  import KodaiAdmin.DataFixtures

  alias KodaiAdmin.Data.Cottage

  @create_attrs %{
    address: "some address",
    name: "some name"
  }
  @update_attrs %{
    address: "some updated address",
    name: "some updated name"
  }
  @invalid_attrs %{address: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cottages", %{conn: conn} do
      conn = get(conn, Routes.cottage_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cottage" do
    test "renders cottage when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cottage_path(conn, :create), cottage: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.cottage_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some address",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cottage_path(conn, :create), cottage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cottage" do
    setup [:create_cottage]

    test "renders cottage when data is valid", %{conn: conn, cottage: %Cottage{id: id} = cottage} do
      conn = put(conn, Routes.cottage_path(conn, :update, cottage), cottage: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.cottage_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cottage: cottage} do
      conn = put(conn, Routes.cottage_path(conn, :update, cottage), cottage: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cottage" do
    setup [:create_cottage]

    test "deletes chosen cottage", %{conn: conn, cottage: cottage} do
      conn = delete(conn, Routes.cottage_path(conn, :delete, cottage))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.cottage_path(conn, :show, cottage))
      end
    end
  end

  defp create_cottage(_) do
    cottage = cottage_fixture()
    %{cottage: cottage}
  end
end
