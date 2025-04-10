defmodule RuleOfThree.Notepads.Line do
  use Ecto.Schema
  import Ecto.Changeset
  alias RuleOfThree.Notepads.Page

  schema "lines" do
    field :description, :string
    field :completed, :boolean, default: false
    belongs_to :page, Page

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(line, attrs) do
    line
    |> cast(attrs, [:description, :completed, :page_id])
    |> validate_required([:description, :completed, :page_id])
  
  end
end
