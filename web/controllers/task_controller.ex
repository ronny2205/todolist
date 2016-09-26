defmodule Todolist.TaskController do
  use Todolist.Web, :controller
    
  def index(conn, %{"name" => name}) do
    {status, body} = File.read("web/static/assets/data.csv")
    tasks = 
      if status == :ok do
        lines = String.split body, "\n"
        tasks = Enum.map(lines, fn(line) -> find_tasks_for_user(line, name) end)
        # remove the file title
        tasks = List.delete_at(tasks, 0)
        tasks = delete_all(tasks, "")
      else
        IO.puts "error reading: web/static/assets/data.csv"
      end
    render conn, tasks: tasks
  end
    
  def index(conn, _params) do
    conn
    |> put_status(400)
    |> text("Error, wrong parameters supplied!")
  end
  
  
  def show(conn, %{"name" => name, "date" => date}) do
    {status, body} = File.read("web/static/assets/data.csv")
    tasks = 
      if status == :ok do
        lines = String.split body, "\n"
        tasks = Enum.map(lines, fn(line) -> find_tasks_user_date(line, name, date) end)
        # remove the file title
        tasks = List.delete_at(tasks, 0)
        tasks = delete_all(tasks, "")
      else
        IO.puts "error reading: web/static/assets/data.csv"
      end
    render conn, tasks: tasks
  end
    
  def show(conn, _params) do
    conn
    |> put_status(400)
    |> text("Error, wrong parameters supplied!")
  end
  
  def find_tasks_for_user(line, user_name) do
    [name, task, date] = String.split line, "|"
    if String.downcase(user_name) == String.downcase(name) do 
      %{task: task}
    else
      ""
    end
  end
  
  def find_tasks_user_date(line, user_name, given_date) do
    [name, task, date] = String.split line, "|"
    if String.downcase(user_name) == String.downcase(name) and given_date == date do
      %{task: task}
    else
      ""
    end
  end
  
  def delete_all(list, value) do
    delete_all(list, value, []) |> Enum.reverse
  end

  defp delete_all([h|[]], value, end_list) when h === value do
    end_list
  end

  defp delete_all([h|[]], _value, end_list) do
    [h|end_list]
  end

  defp delete_all([h|t], value, end_list) when h === value do
    delete_all(t, value, end_list)
  end

  defp delete_all([h|t], value, end_list) do
    delete_all(t, value, [h|end_list])
  end
end  