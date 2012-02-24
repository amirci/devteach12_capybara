class ProjectEditPage
  include PageObject
  
  def activate
    check("project_active")
    self
  end
  
  def save
    click_button("Save Project")
    ProjectListPage.new
  end
  
end