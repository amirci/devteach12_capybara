require 'spec_helper'

describe ProjectsController do

  let(:projects) { (1..10).map { |i| double(Project, id: i, name: "Project #{i}", description: "The awesomest project ever") } }

  describe "#index" do
    before do 
      Project.stub(:all).and_return(projects)
      get :index 
    end
    
    it { should assign_to(:projects).with(projects) }
  end
  
  describe "#edit" do
    let(:project) { projects.first }

    before do 
      Project.stub(:find).with("1").and_return(project)
      get :edit, id: 1
    end
    
    it { should assign_to(:project).with(project) }
  end
  
end
