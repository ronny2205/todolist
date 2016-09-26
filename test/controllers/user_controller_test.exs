defmodule ListingUsers.UserControllerTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias Todolist.Router

  @opts Router.init([])
  test 'listing users' do
    conn = conn(:get, "/users")
    response = Router.call(conn, @opts)
    assert response.status == 200
    assert response.resp_body == "[{\"name\":\"alice\"},{\"name\":\"bob\"},{\"name\":\"claire\"}]"
  end
end