Given /^I have some projects loaded$/ do
  FactoryGirl.create_list(:project, 10)
end

Given /^I have a project called "(#{PROJECT_NAME})"$/ do |name|
  current_project FactoryGirl.create(:project, name: name)
end

When /^I browse all the projects$/ do
  project_list_page.navigate
end

When /^I activate the project$/ do
  project_list_page
    .navigate
    .edit(current_project)
    .activate
    .save
end

When /^I delete the project$/ do
  project_list_page
    .navigate
    .delete(current_project)
end

Then /^I should see the complete list of projects$/ do
  project_list_page.projects.should match_stored_projects
end

Then /^the project should be shown active on the listing$/ do
  project_list_page.active?(current_project).should == true
end

Then /^I should not see the project in the listing$/ do
  project_list_page.projects.should_not include_stored_project(current_project)
end
