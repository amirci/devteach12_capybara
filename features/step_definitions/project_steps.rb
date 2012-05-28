Given /^I have some projects loaded$/ do
  FactoryGirl.create_list(:project, 10)
end

Given /^I have a project called "([^"]*)"$/ do |name|
  current_project FactoryGirl.create(:project, name: name)
end

When /^I browse all the projects$/ do
  visit "/projects"
end

When /^I activate the project$/ do
  pending
end

Then /^I should see the complete list of projects$/ do
  actual = all(:css, "#projects tbody tr")
    .map { |tr| tr.all("td").map(&:text) }
    .map { |cells| {name: cells[0], description: cells[1], active: cells[2] == 'true'}}
  expected = Project.all.map { |p| {name: p.name, description: p.description, active: p.active} }
  actual.should == expected
end

Then /^the project should be shown active in the listing$/ do
  pending
end
