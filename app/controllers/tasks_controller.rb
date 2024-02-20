class TasksController < ApplicationController

  # 1. index() method (with .all) to fetch all @tasks
  # Make all tasks a variable with @ so it can be used in View
  def index
    @tasks = Task.all
  end

  # 2. show() method (with .find(id)) to show one task
  # Make readable task variable with @ so it can be used in View
  def show
    id = params[:id]
    @task = Task.find(id)
  end

  # 3. new() method (with .new) to create a task
  # Make new task a variable with @ so it can be used in View as "emtpy recepticle"
  def new
    @task = Task.new
  end

  # 4. create() method to use form input to create a task to display on /tasks
  # No view required since it's post :)
  def create
    # 1. Fill in the empty Task generated with .new with the parameters posted from the form (params)
    # @task = Task.new(params[:task]) does not work, task_params must be called instead to get params!
    @task = Task.new(task_params)
    # 2. Save the new Task instance
    @task.save
    # 3. Add redirect to go back to tasks page with redirect_to method (redirect_to xxx_path(@instance))
    redirect_to tasks_path
  end

  private

  # 4. for create() method - to allow use of the new task instance parameters to use on /tasks
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
