class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
end
