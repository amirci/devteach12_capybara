Given /^I have some projects loaded$/ do
  10.times { |i| Project.create(name: "Project #{i}", description: "The best project ever")}
end

When /^I go to the projects page$/ do
  visit('/projects')
end

Then /^I should the complete list of projects$/ do
  pending # express the regexp above with the code you wish you had
end
