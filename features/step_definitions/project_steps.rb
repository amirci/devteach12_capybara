Given /^I have some projects loaded$/ do
  10.times { |i| Project.create(name: "Project #{i}", description: "The best project ever")}
end

Given /^I have a project called "([^"]*)"$/ do |name|
  @last_project = Project.create(name: name, description: "A cool project called #{name}")
end

When /^I go to the projects page$/ do
  @listing = ProjectListPage.new.navigate
end

When /^I activate the project$/ do
  ProjectListPage.new.
    navigate.
    edit.
    activate.
    save
end

Then /^I should see the complete list of projects$/ do
  @listing.projects.should == Project.all.map { |p| {name: p.name, description: p.description} }
end
