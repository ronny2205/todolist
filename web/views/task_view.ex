defmodule Todolist.TaskView do
  use Todolist.Web, :view

  def render("index.json", %{tasks: tasks}) do
    tasks
  end
  
  def render("show.json", %{tasks: tasks}) do
    tasks
  end
end