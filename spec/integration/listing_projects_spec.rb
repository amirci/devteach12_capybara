require 'spec_helper'

feature 'listing projects' do
  
  scenario 'listing all projects' do
    FactoryGirl.create_list(:project, 10)
    visit projects_path
    actual = all(:css, "#projects tbody tr")
      .map { |tr| tr.all("td").map(&:text) }
      .map { |cells| {name: cells[0], description: cells[1], active: cells[2] == 'true'}}
    expected = Project.all.map { |p| {name: p.name, description: p.description, active: p.active} }
    actual.should == expected
  end
end