defmodule KodaiAdmin.Data.Cottage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cottages" do
    field :location, :string
    field :name, :string
    field :rooms, :integer
    field :persons_allowed, :integer
    field :price, :float
    field :images, {:array, :binary}
    timestamps()
  end

  @doc false
  def changeset(cottage, attrs) do
    cottage
    |> cast(attrs, [:name, :location, :rooms, :persons_allowed, :price, :images])
    |> validate_required([:name, :location, :rooms, :persons_allowed, :price, :images])
  end
end
