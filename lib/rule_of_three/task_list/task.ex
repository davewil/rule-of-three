defmodule RuleOfThree.TaskList.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :content, :string
    field :is_ticked, :boolean, default: false
    field :is_carried, :boolean, default: false
    field :is_removed, :boolean, default: false
    field :page_count, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:content, :is_ticked, :is_carried, :is_removed, :page_count])
    |> validate_required([:content, :is_ticked, :is_carried, :is_removed, :page_count])
  end
end
