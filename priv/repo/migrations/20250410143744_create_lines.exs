defmodule RuleOfThree.Repo.Migrations.CreateLines do
  use Ecto.Migration

  def change do
    create table(:lines) do
      add :description, :string
      add :completed, :boolean, default: false, null: false
      add :page_id, references(:pages, on_delete: :delete_all), null: false


      timestamps(type: :utc_datetime)
    end

    create index(:lines, [:page_id])
  end
end
