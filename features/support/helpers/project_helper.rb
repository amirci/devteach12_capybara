module ProjectHelper 
  
  def current_project
    @current_project
  end

  def set_current_project(some_project)
    @current_project = some_project
  end
  
  def project_list_page
    @project_list_page ||= ProjectListPage.new
  end
  
end

World(ProjectHelper)