class ProjectEditPage
  include PageObject
  
  def activate
    check('project_active')
    self
  end
  
  def save
    click_button("Update Project")
    ProjectListPage.new
  end
  
end