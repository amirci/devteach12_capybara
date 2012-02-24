class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    redirect_to action: :index
  end
  
end
