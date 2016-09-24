defmodule ListingTasks.TaskControllerTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias Todolist.Router

  @opts Router.init([])
  test 'listing tasks' do
    conn = conn(:get, "/tasks")
    response = Router.call(conn, @opts)
    assert response.status == 200
    #assert response.resp_body == "[]"
  end
end