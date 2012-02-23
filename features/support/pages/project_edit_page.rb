class ProjectEditPage
  include PageObject
  
  def activate
    self
  end
  
  def save
    ProjectListPage.new
  end
  
end