require "rails_helper"

RSpec.describe PromptsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/prompts").to route_to("prompts#index")
    end

    it "routes to #new" do
      expect(:get => "/prompts/new").to route_to("prompts#new")
    end

    it "routes to #show" do
      expect(:get => "/prompts/1").to route_to("prompts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/prompts/1/edit").to route_to("prompts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/prompts").to route_to("prompts#create")
    end

    it "routes to #update" do
      expect(:put => "/prompts/1").to route_to("prompts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/prompts/1").to route_to("prompts#destroy", :id => "1")
    end

  end
end
