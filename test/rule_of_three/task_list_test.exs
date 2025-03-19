defmodule RuleOfThree.TaskListTest do
  use RuleOfThree.DataCase

  alias RuleOfThree.TaskList

  describe "tasks" do
    alias RuleOfThree.TaskList.Task

    import RuleOfThree.TaskListFixtures

    @invalid_attrs %{content: nil, is_ticked: nil, is_carried: nil, is_removed: nil, page_count: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert TaskList.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert TaskList.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{content: "some content", is_ticked: true, is_carried: true, is_removed: true, page_count: 42}

      assert {:ok, %Task{} = task} = TaskList.create_task(valid_attrs)
      assert task.content == "some content"
      assert task.is_ticked == true
      assert task.is_carried == true
      assert task.is_removed == true
      assert task.page_count == 42
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskList.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{content: "some updated content", is_ticked: false, is_carried: false, is_removed: false, page_count: 43}

      assert {:ok, %Task{} = task} = TaskList.update_task(task, update_attrs)
      assert task.content == "some updated content"
      assert task.is_ticked == false
      assert task.is_carried == false
      assert task.is_removed == false
      assert task.page_count == 43
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskList.update_task(task, @invalid_attrs)
      assert task == TaskList.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = TaskList.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> TaskList.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = TaskList.change_task(task)
    end
  end
end
