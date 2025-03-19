defmodule RuleOfThree.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :content, :string
      add :is_ticked, :boolean, default: false, null: false
      add :is_carried, :boolean, default: false, null: false
      add :is_removed, :boolean, default: false, null: false
      add :page_count, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
