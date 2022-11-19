defmodule KodaiAdmin.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KodaiAdmin.Data` context.
  """

  @doc """
  Generate a cottage.
  """
  def cottage_fixture(attrs \\ %{}) do
    {:ok, cottage} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name"
      })
      |> KodaiAdmin.Data.create_cottage()

    cottage
  end
end
