Given /^I have some projects loaded$/ do
  10.times { |i| Project.create(name: "Project #{i}", description: "The best project ever")}
end

Given /^I have a project called "([^"]*)"$/ do |name|
  @last_project = Project.create(name: name, description: "A cool project called #{name}")
end

When /^I go to the projects page$/ do
  project_list_page.navigate
end

When /^I activate the project$/ do
  project_list_page.
    navigate.
    edit(@last_project).
    activate.
    save
end

Then /^I should see the complete list of projects$/ do
  project_list_page.projects.should == Project.all.map { |p| {name: p.name, description: p.description, active?: p.active?} }
end

Then /^the project should be active in the listing$/ do
  actual = project_list_page.projects.select { |p| p[:name] == @last_project.name }.first
  actual[:active?].should be_true
end
