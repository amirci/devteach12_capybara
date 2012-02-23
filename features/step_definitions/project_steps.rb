Given /^I have some projects loaded$/ do
  10.times { |i| Project.create(name: "Project #{i}", description: "The best project ever")}
end

When /^I go to the projects page$/ do
  visit('/projects')
end

Then /^I should see the complete list of projects$/ do
  listing = ProjectListPage.new
  
  listing.projects.should == Project.all.map { |p| {name: p.name, description: p.description} }
end
