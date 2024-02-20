Rails.application.routes.draw do

  # view only required for get

  get "up" => "rails/health#show", as: :rails_health_check

  # READ (1) -- GET all to give list (index) - http://localhost:3000/tasks/
  get "/tasks", to: "tasks#index"

  # CREATE (1) -- GET form to add new task - http://localhost:3000/tasks/new
  get "tasks/new", to: "tasks#new"

  # CREATE (2) -- POST form input to (create task for) /tasks page - http://localhost:3000/tasks/
  # -- no view required since it's post (also for patch & destroy!)
  post "/tasks", to: "tasks#create"

  # READ (2) -- GET one (.find(id)) - http://localhost:3000/tasks/1 - dynamic URL
  # , as: task is added to get prefix for this one as well :)
  get "tasks/:id", to: "tasks#show", as: :task

  # EDIT (1) -- GET form to edit task - http://localhost:3000/tasks/:id/edit
  get "tasks/:id/edit", to: "tasks#edit", as: :edit_task

  # EDIT (2) -- PATCH form to update task instance - http://localhost:3000/tasks/:id
  patch "tasks/:id", to: "tasks#update"

  # REMOVE -- DELETE task w/id to destroy task instance - http://localhost:3000/restaurants/1
  # Not their own view, delete option in task instance page
  delete "tasks/:id", to: "tasks#destroy"

end
