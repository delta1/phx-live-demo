defmodule LiveDemo.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :status, :string, default: "created"

      timestamps()
    end
  end
end
