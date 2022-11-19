defmodule KodaiAdmin.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias KodaiAdmin.Repo

  alias KodaiAdmin.Data.Cottage

  @doc """
  Returns the list of cottages.

  ## Examples

      iex> list_cottages()
      [%Cottage{}, ...]

  """
  def list_cottages do
    Repo.all(Cottage)
  end

  @doc """
  Gets a single cottage.

  Raises `Ecto.NoResultsError` if the Cottage does not exist.

  ## Examples

      iex> get_cottage!(123)
      %Cottage{}

      iex> get_cottage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cottage!(id), do: Repo.get!(Cottage, id)

  @doc """
  Creates a cottage.

  ## Examples

      iex> create_cottage(%{field: value})
      {:ok, %Cottage{}}

      iex> create_cottage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cottage(attrs \\ %{}) do
    %Cottage{}
    |> Cottage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cottage.

  ## Examples

      iex> update_cottage(cottage, %{field: new_value})
      {:ok, %Cottage{}}

      iex> update_cottage(cottage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cottage(%Cottage{} = cottage, attrs) do
    cottage
    |> Cottage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cottage.

  ## Examples

      iex> delete_cottage(cottage)
      {:ok, %Cottage{}}

      iex> delete_cottage(cottage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cottage(%Cottage{} = cottage) do
    Repo.delete(cottage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cottage changes.

  ## Examples

      iex> change_cottage(cottage)
      %Ecto.Changeset{data: %Cottage{}}

  """
  def change_cottage(%Cottage{} = cottage, attrs \\ %{}) do
    Cottage.changeset(cottage, attrs)
  end
end
