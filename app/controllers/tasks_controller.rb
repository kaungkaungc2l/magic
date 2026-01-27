class TasksController < ApplicationController
    def index
      @project = Project.find(params[:project_id])
      @tasks = @project.tasks
    end

    def show
      @project = Project.find(params[:project_id])
      @task = @project.tasks.find(params[:id])
    end

    def new
      @project = Project.find(params[:project_id])
      @task = @project.tasks.new
    end
    
    def create
      @project = Project.find(params[:project_id])
      @task = @project.tasks.new(task_params)
      if @task.save
        redirect_to project_task_path(@project, @task)
    else
        render :new
      end
    end

    def edit
      @project = Project.find(params[:project_id])
      @task = @project.tasks.find(params[:id])
    end

    def update
      @project = Project.find(params[:project_id])
      @task = @project.tasks.find(params[:id])
      if @task.update(task_params)
        redirect_to project_task_path(@project, @task)
      else
        render :edit
      end
    end

    def destroy
      @project = Project.find(params[:project_id])
      @task = @project.tasks.find(params[:id])
      @task.destroy
      redirect_to project_tasks_path(@project)
    end

    private
    def task_params
        params.require(:task).permit(:title, :description, :status)
    end
end
