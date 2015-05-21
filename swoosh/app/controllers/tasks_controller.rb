class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # @tasks = Task.where(:start_date => Date.today..Date.today)

  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.status = params[:status]
    @task.create_date = params[:create_date]
    @task.start_date = params[:start_date]
    @task.complete = params[:complete]
    @task.category_id = params[:category_id]
    @task.due_on = params[:due_on]
    @task.user_id = params[:user_id]
    @task.description = params[:description]

    if @task.save
      redirect_to "/tasks", :notice => "Task created successfully."
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.status = params[:status]
    @task.create_date = params[:create_date]
    @task.start_date = params[:start_date]
    @task.complete = params[:complete]
    @task.category_id = params[:category_id]
    @task.due_on = params[:due_on]
    @task.user_id = params[:user_id]
    @task.description = params[:description]

    if @task.save
      redirect_to "/tasks", :notice => "Task updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    redirect_to "/tasks", :notice => "Task deleted."
  end

# Show today's date
  def current
    ::Time.zone ? ::Time.zone.today : ::Date.today
  end

end
