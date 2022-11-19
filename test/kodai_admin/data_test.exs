defmodule KodaiAdmin.DataTest do
  use KodaiAdmin.DataCase

  alias KodaiAdmin.Data

  describe "cottages" do
    alias KodaiAdmin.Data.Cottage

    import KodaiAdmin.DataFixtures

    @invalid_attrs %{address: nil, name: nil}

    test "list_cottages/0 returns all cottages" do
      cottage = cottage_fixture()
      assert Data.list_cottages() == [cottage]
    end

    test "get_cottage!/1 returns the cottage with given id" do
      cottage = cottage_fixture()
      assert Data.get_cottage!(cottage.id) == cottage
    end

    test "create_cottage/1 with valid data creates a cottage" do
      valid_attrs = %{address: "some address", name: "some name"}

      assert {:ok, %Cottage{} = cottage} = Data.create_cottage(valid_attrs)
      assert cottage.address == "some address"
      assert cottage.name == "some name"
    end

    test "create_cottage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_cottage(@invalid_attrs)
    end

    test "update_cottage/2 with valid data updates the cottage" do
      cottage = cottage_fixture()
      update_attrs = %{address: "some updated address", name: "some updated name"}

      assert {:ok, %Cottage{} = cottage} = Data.update_cottage(cottage, update_attrs)
      assert cottage.address == "some updated address"
      assert cottage.name == "some updated name"
    end

    test "update_cottage/2 with invalid data returns error changeset" do
      cottage = cottage_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_cottage(cottage, @invalid_attrs)
      assert cottage == Data.get_cottage!(cottage.id)
    end

    test "delete_cottage/1 deletes the cottage" do
      cottage = cottage_fixture()
      assert {:ok, %Cottage{}} = Data.delete_cottage(cottage)
      assert_raise Ecto.NoResultsError, fn -> Data.get_cottage!(cottage.id) end
    end

    test "change_cottage/1 returns a cottage changeset" do
      cottage = cottage_fixture()
      assert %Ecto.Changeset{} = Data.change_cottage(cottage)
    end
  end
end
