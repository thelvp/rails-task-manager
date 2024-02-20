Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  # 1. GET all (.all) - http://localhost:3000/tasks/
  get "/tasks", to: "tasks#index"

  # 3. GET form to add (new) task - http://localhost:3000/tasks/new
  get "tasks/new", to: "tasks#new"

  # 4. POST form input to (create task for) /tasks page - http://localhost:3000/tasks/
  # -- no view required since it's post (also for patch & destroy!)
  post "/tasks", to: "tasks#create"

  # 2. GET one (.find(id)) - http://localhost:3000/tasks/1 - dynamic URL
  # , as: task is added to get prefix for this one as well :)
  get "tasks/:id", to: "tasks#show", as: :task

end
