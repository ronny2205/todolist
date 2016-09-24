defmodule Todolist.UserController do
  use Todolist.Web, :controller

  

  def index(conn, _params) do
  
    {status, body} = File.read("web/static/assets/data.csv")
    users = 
      if status == :ok do
          lines = String.split body, "\n"
          users = Enum.map(lines, fn(line) -> split_line(line) end)
          # remove the file title
          users = List.delete_at(users, 0)
          users = Enum.uniq(users)
      else
          IO.puts "error reading: web/static/assets/data.csv"
      end
  
    # users1 = CSVLixir.read("web/static/assets/data.csv") |> Enum.to_list
  
    # users1 = %{name: "Yafa", task: "Eat brunch"}
    render conn, users: users
  end
  
  def split_line(line) do
    [name, task, date] = String.split line, "|"
    %{name: name}
    # %{name: name, task: task, date: date}
  end
end