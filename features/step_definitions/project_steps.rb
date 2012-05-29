Given /^I have some projects loaded$/ do
  FactoryGirl.create_list(:project, 10)
end

Given /^I have a project called "([^"]*)"$/ do |name|
  current_project FactoryGirl.create(:project, name: name)
end

When /^I browse all the projects$/ do
  visit projects_path
end

When /^I activate the project$/ do
  step "I browse all the projects"
  within "tr[data-id='#{current_project.id}']" do
    click_link("Edit")
  end
  check('project_active')
  click_button("Update Project")
end

When /^I delete the project$/ do
  visit projects_path
  within "tr[data-id='#{current_project.id}']" do
    page.evaluate_script('window.confirm = function() { return true; }')
    click_link("Delete")
  end
end

Then /^I should see the complete list of projects$/ do
  actual = all(:css, "#projects tbody tr")
    .map { |tr| tr.all("td").map(&:text) }
    .map { |cells| {name: cells[0], description: cells[1], active: cells[2] == 'true'}}
  expected = Project.all.map { |p| {name: p.name, description: p.description, active: p.active} }
  actual.should == expected
end

Then /^the project should be shown active on the listing$/ do
  step "I browse all the projects"
  within "tr[data-id='#{current_project.id}']" do
    find("td:nth-child(3)").text.should == 'true'
  end
end

Then /^I should not see the project in the listing$/ do
  visit projects_path
  page.should_not have_content(current_project.name)
end
