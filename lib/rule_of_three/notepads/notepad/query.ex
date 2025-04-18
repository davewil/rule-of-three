defmodule RuleOfThree.Notepad.Query do
  import Ecto.Query
  alias RuleOfThree.Notepads.Notepad

  def base do
    Notepad
  end

  def for_user(query \\ base(), user) do
    query
    |> where([d], d.user_id == ^user.id)
  end
end
