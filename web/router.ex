defmodule Todolist.Router do
  use Todolist.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Todolist do
    pipe_through :api
    get "/users", UserController, :index
    get "/tasks", TaskController, :index
  end
end
