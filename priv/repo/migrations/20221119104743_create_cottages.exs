defmodule KodaiAdmin.Repo.Migrations.CreateCottages do
  use Ecto.Migration

  def change do
    create table(:cottages) do
      add :name, :string
      add :location, :string
      add :rooms, :integer
      add :persons_allowed, :integer
      add :price, :float
      add :images, {:array, :binary}

      timestamps()
    end
  end
end
