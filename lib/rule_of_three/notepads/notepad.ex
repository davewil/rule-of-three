defmodule RuleOfThree.Notepads.Notepad do
  use Ecto.Schema
  import Ecto.Changeset
  alias RuleOfThree.Accounts.User
  alias RuleOfThree.Notepads.Page

  schema "notepads" do
    field :name, :string
    field :current_page, :integer, default: 1
    belongs_to :user, User

    timestamps(type: :utc_datetime)
    has_many :pages, Page
  end

  @doc false
  def changeset(notepad, attrs) do
    notepad
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end

end
