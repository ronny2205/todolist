defmodule Todolist.UserView do
  use Todolist.Web, :view

  def render("index.json", %{users: users}) do
    users.name
  end
end