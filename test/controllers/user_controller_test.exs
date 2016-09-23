defmodule ListingUsers.UserControllerTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias Todolist.Router

  @opts Router.init([])
  test 'listing users' do
    # task1 = %User{name: "Yafa", task: "Eat brunch", date: "|2016-09-08 "}
    conn = conn(:get, "/users")
    response = Router.call(conn, @opts)
    assert response.status == 200
    assert response.resp_body == "[]"
  end
end