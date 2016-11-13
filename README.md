# Todolist


A simple JSON REST style API that helps users manage tasks, using elixir & phoenix. 

The API has two Endpoints - Users and Tasks.

Send a get request to /users to recieve the list of all users:
curl localhost:4000/users

Send a get request to /tasks with a user name param to recieve all the tasks for that user:
curl localhost:4000/tasks\?name="bob"

Send a get request to /tasks/date with user name and date params to recieve all the tasks for that user in that date:
curl localhost:4000/tasks/date\?name="bob"\&date="2016-09-09"

If there are less params than expected, you will recieve an error.
If there are no matching taks, you will recieve an empty list.

Run 'mix test' to run the unit tests.
