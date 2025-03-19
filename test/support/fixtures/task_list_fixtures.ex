defmodule RuleOfThree.TaskListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RuleOfThree.TaskList` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        content: "some content",
        is_carried: true,
        is_removed: true,
        is_ticked: true,
        page_count: 42
      })
      |> RuleOfThree.TaskList.create_task()

    task
  end
end
