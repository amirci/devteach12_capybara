Given /^I have some projects loaded$/ do
  10.times { |i| Project.create(mame: "Project #{i}", description: "The best project ever")}
end

When /^I go to the projects page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should the complete list of projects$/ do
  pending # express the regexp above with the code you wish you had
end
