class TasksController < ApplicationController

  # READ (1) -- fetch all @tasks
  # Make all tasks a variable with @ so it can be used in View
  def index
    @tasks = Task.all
  end

  # READ (2) -- show one task
  # Make readable task variable with @ so it can be used in View
  def show
    find_task()
  end

  # CREATE (1) -- create a empty task for form initialization
  # Make new task a variable with @ so it can be used in View as "emtpy recepticle"
  def new
    @task = Task.new
  end

  # CREATE (2) -- create task instance w/form input
  # No need for app/views/restaurants/update.html.erb
  def create
    # 1. Fill in the empty Task generated with .new with the parameters posted from the form (params)
    # Task_params must be called to get params to create a new Task instance
    @task = Task.new(task_params)
    @task.save
    # 3. Add redirect to go back to tasks page with redirect_to method (redirect_to xxx_path(@instance))
    redirect_to tasks_path
  end

  # UPDATE (1) -- find existing task instance
  def edit
    find_task()
  end

  # UPDATE (2) -- edit the existing task instance w/form input
  def update
    find_task()
    @task.update(task_params)
    # No need for app/views/tasks/update.html.erb
    # Task_params must be called instead to get params; are the params given in form
    # Redirect to task (id) page
    redirect_to task_path
  end

  # DELETE -- destroy task instance w/form input
  def destroy
    find_task()
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    # Redirect to tasks page, add status: :see_other to prevent 303 error
    redirect_to tasks_path, status: :see_other
  end

  private

  # MAKING TASK PARAMETERS USABLE FOR METHODS ABOVE (create & update)
  # (so to allow use of the new task instance parameters to create/edit a task instance)
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  # For use in multiple methods; get @task
  def find_task
    id = params[:id]
    @task = Task.find(id)
  end


end
