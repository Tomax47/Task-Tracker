class TasksController < ApplicationController

  def new
    #@project = set_project
    @task = Task.new
  end

  def show
    @task = set_task
  end

  def edit
    @task = set_task
  end

  def create
    #@project = set_project
    @task = Task.new(task_params)

    if @task.save
      redirect_to project_tasks_path, notice: "Task has been added!"
    else
      flash[:notice] = "Something went wrong!"
    end
  end

  def update
    @task = set_task

    if @task.update(task_params)
      redirect_to @task, notice: "Task has been updated!"
    else
      flash[:notice] = "Something went wrong!"
    end
  end

  def destroy
    @task = Task.find_by(params[:id])

    if @task.destroy
      redirect_to project_path(@task.project), notice: "Task has been deleted!"
    else
      flash[:notice] = "Something went wrong!"
    end
  end

  private

  def set_task
    #@project = set_project
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:task_title, :task_description, :state, :deadline).merge(project_id: params[:project_id])
  end
end
