class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
    Rails.logger.debug { "*** Returning all projects #{@projects.inspect}" }
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to action: :index
  end

  def destroy
    Project.delete(params[:id])
    redirect_to action: :index
  end
  
end
