defmodule Todolist.UserController do
  use Todolist.Web, :controller

  def index(conn, _params) do
    render conn, users: []
  end
end