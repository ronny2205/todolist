defmodule Todolist.UserController do
  use Todolist.Web, :controller

  

  def index(conn, _params) do
    users1 = %{name: "Yafa", task: "Eat brunch"}
    render conn, users: users1
  end
end