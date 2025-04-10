defmodule RuleOfThree.NotepadsFixtures do
  import RuleOfThree.AccountsFixtures
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RuleOfThree.Notepads` context.
  """

  @doc """
  Generate a notepad.
  """
  def notepad_fixture(attrs \\ %{}) do
    {:ok, notepad} =
      attrs
      |> Enum.into(%{
        current_page: 42,
        name: "some name",
        user_id: user_fixture().id
      })
      |> RuleOfThree.Notepads.create_notepad()

    notepad
  end

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    {:ok, page} =
      attrs
      |> Enum.into(%{
        max_lines: 42,
        number: 42,
        notepad_id: notepad_fixture().id
      })
      |> RuleOfThree.Notepads.create_page()

    page
  end

  @doc """
  Generate a line.
  """
  def line_fixture(attrs \\ %{}) do
    {:ok, line} =
      attrs
      |> Enum.into(%{
        completed: true,
        description: "some description",
        page_id: page_fixture().id
      })
      |> RuleOfThree.Notepads.create_line()

    line
  end
end
