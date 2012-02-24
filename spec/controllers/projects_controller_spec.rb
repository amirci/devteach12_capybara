require 'spec_helper'

describe ProjectsController do

  let(:projects) { (1..10).map { |i| stub_model(Project, id: i, name: "Project #{i}", description: "The awesomest project ever") } }

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

  describe "#update" do
    let(:project) { projects.first }

    before do 
      Project.stub(:find).with("1").and_return(project)
      project.should_receive(:update_attributes).with({"active" => true})
      post :update, id: 1, project: { active: true }
    end
    
    it { should redirect_to(action: :index) }
  end
  
end
