module ProjectHelper 
  
  def current_project(project = nil)
    @current_project ||= project
  end
  
  def project_list_page
    @project_list_page ||= ProjectListPage.new
  end
  
end

World(ProjectHelper)