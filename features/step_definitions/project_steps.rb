Given /^I have some projects loaded$/ do
  10.times { |i| Project.create(name: "Project #{i}", description: "The best project ever")}
end

When /^I go to the projects page$/ do
  visit('/projects')
end

Then /^I should the complete list of projects$/ do
  actual = all(:css, "#projects tr").
                    drop(1). #drop the header
                    map { |r| r.all(:css, 'td').map { |node| node.text } }
  
  actual.should == Project.all.map { |p| [p.name, p.description] }
end
