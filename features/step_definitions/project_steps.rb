Given /^I have some projects loaded$/ do
  10.times { |i| Project.create(name: "Project #{i}", description: "The best project ever")}
end

Given /^I have a project called "([^"]*)"$/ do |name|
  set_current_project Project.create(name: name, description: "A cool project called #{name}")
end

When /^I go to the projects page$/ do
  project_list_page.navigate
end

When /^I activate the project$/ do
  project_list_page.
    navigate.
    edit(current_project).
    activate.
    save
end

Then /^I should see the complete list of projects$/ do
  to_compare = lambda { |p| [p.name, p.description] }
  actual = project_list_page.projects.map(&to_compare)
  expected = Project.all.map(&to_compare)
  actual.should == expected
end

Then /^the project should be active in the listing$/ do
  project_list_page.with_name(current_project.name).active?.should be_true
end
