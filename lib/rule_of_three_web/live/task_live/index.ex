defmodule RuleOfThreeWeb.TaskLive.Index do
  use RuleOfThreeWeb, :live_view

  alias RuleOfThree.TaskList
  alias RuleOfThree.TaskList.Task

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :tasks, TaskList.list_tasks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Task")
    |> assign(:task, TaskList.get_task!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Task")
    |> assign(:task, %Task{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tasks")
    |> assign(:task, nil)
  end

  @impl true
  def handle_info({RuleOfThreeWeb.TaskLive.FormComponent, {:saved, task}}, socket) do
    {:noreply, stream_insert(socket, :tasks, task)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    task = TaskList.get_task!(id)
    {:ok, _} = TaskList.delete_task(task)

    {:noreply, stream_delete(socket, :tasks, task)}
  end
end
