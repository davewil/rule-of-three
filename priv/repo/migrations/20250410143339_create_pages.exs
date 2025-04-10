defmodule RuleOfThree.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :number, :integer
      add :max_lines, :integer
      add :notepad_id, references(:notepads, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:pages, [:notepad_id])
  end
end
