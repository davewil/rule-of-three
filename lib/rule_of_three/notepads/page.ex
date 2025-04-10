defmodule RuleOfThree.Notepads.Page do
  use Ecto.Schema
  import Ecto.Changeset

  alias RuleOfThree.Notepads.Notepad
  alias RuleOfThree.Notepads.Line

  schema "pages" do
    field :number, :integer
    field :max_lines, :integer
    belongs_to :notepad, Notepad
    timestamps(type: :utc_datetime)

    has_many :lines, Line
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:number, :max_lines, :notepad_id])
    |> validate_required([:number, :max_lines, :notepad_id])
  end
end
