class TasksController < ApplicationController
  before_action :set_project

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project, notice: "Task created!" }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_task", partial: "tasks/form", locals: { project: @project, task: @task }) }
        format.html { render "projects/show", status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :status)
  end
end
