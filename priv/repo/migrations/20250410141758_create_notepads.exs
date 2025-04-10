defmodule RuleOfThree.Repo.Migrations.CreateNotepads do
  use Ecto.Migration

  def change do
    create table(:notepads) do
      add :name, :string
      add :user_id, references(:users), null: false
      add :current_page, :integer, default: 1

      timestamps(type: :utc_datetime)
    end
  end
end
