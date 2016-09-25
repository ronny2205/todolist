defmodule Todolist.TaskView do
  use Todolist.Web, :view

  def render("index.json", %{tasks: tasks}) do
    tasks
  end
end