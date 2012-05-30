module ProjectHelper 
  
  def current_project(project = nil)
    @current_project ||= project
  end
  
  def project_list_page
    @project_list_page ||= ProjectListPage.new
  end
  
  def stored_map(p)
    {name: p.name, description: p.description, active: p.active}
  end
  
  module Matchers
  		RSpec::Matchers.define :match_stored_projects do
  			match do |actual|
          @expected = Project.all.map { |p| stored_map(p) }
          actual == @expected
  			end

  			failure_message_for_should do |actual|
  				"The projects in the page should match the stored one\n" +
  				"The page contains #{actual}' \n" +
  				"But the storage contains #{@expected}"
  			end
  		end

  		RSpec::Matchers.define :include_stored_project do |project|
  			match do |actual|
          actual.include? (@expected = stored_map(project))
  			end
  			
  			failure_message_for_should_not do |actual|
  				"The projects in the page should not include the stored project\n" +
  				"The page project list is #{actual}' \n" +
  				"And it should not include #{@expected}"
  			end
  			
  		end
  end
end

World(ProjectHelper)