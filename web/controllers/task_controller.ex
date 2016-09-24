defmodule Todolist.TaskController do
  use Todolist.Web, :controller

 

  def index(conn, _params) do
     render conn, tasks: []
  end
  
end  