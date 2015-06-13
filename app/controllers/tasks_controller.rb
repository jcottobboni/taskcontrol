class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update, :destroy,:new,:edit]
  before_action :set_tasks, only: [:edit, :update, :destroy]
  respond_to :html, :js
  before_action :authenticate_user!

  def new
    @task = Task.new
   
  end

  def create
    @task = Task.create(task_params)
  end

  def update
    @task.update_attributes(task_params)
  end

  def destroy
    @task.destroy
  end

  private

    def all_tasks
      @tasks = Task.all
      @comment = Comment.new
    end

    def set_tasks
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :start_date,:end_date,:cost,:status)
    end
end