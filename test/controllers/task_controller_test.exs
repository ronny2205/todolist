defmodule ListingTasks.TaskControllerTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias Todolist.Router

  @opts Router.init([])
     
  test 'listing tasks for user with no params' do
    conn = conn(:get, "/tasks")
    response = Router.call(conn, @opts)
    assert response.status == 400
    assert response.resp_body == "Error, wrong parameters supplied!"
  end
  
  test 'listing tasks for user' do
    conn = conn(:get, "/tasks", %{"name" => "tom"})
    response = Router.call(conn, @opts)
    assert response.status == 200
    assert response.resp_body == "[]"
  end
  
  test 'listing tasks for user2' do
    conn = conn(:get, "/tasks", %{"name" => "bob"})
    response = Router.call(conn, @opts)
    assert response.status == 200
    assert response.resp_body == "[{\"task\":\"Call mom\"},{\"task\":\"Do laundry\"}]"
  end
  
#   test 'listing tasks for user and date' do
#     conn = conn(:get, "/tasks", %{"name" => "tom", "date" => "2014-05-05"})
#     response = Router.call(conn, @opts)
#     assert response.status == 200
#     #assert response.resp_body == "[]"
#   end
end