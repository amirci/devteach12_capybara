Given /^I have some projects loaded$/ do
  FactoryGirl.create_list(:project, 10)
end

Given /^I have a project called "([^"]*)"$/ do |name|
  current_project FactoryGirl.create(:project, name: name)
end

When /^I browse the projects$/ do
  pending
end

When /^I activate the project$/ do
  pending
end

Then /^I should see the complete list of projects$/ do
  pending
end

Then /^the project should be shown active in the listing$/ do
  pending
end
