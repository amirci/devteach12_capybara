require 'spec_helper'

describe ProjectsController do

  describe "#index" do
    let(:projects) { (1..10).map { |i| double(Project, name: "Project #{i}", description: "The awesomest project ever") } }

    before do 
      Project.stub(:all).and_return(projects)
      get :index 
    end
    
    it { should assign_to(:projects).with(projects) }
  end
end
