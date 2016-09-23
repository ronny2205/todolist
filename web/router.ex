defmodule Todolist.Router do
  use Todolist.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Todolist do
    pipe_through :api
  end
end
