require "rails_helper"

RSpec.describe MwsResponsesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/aws_responses").to route_to("aws_responses#index")
    end

    it "routes to #new" do
      expect(:get => "/aws_responses/new").to route_to("aws_responses#new")
    end

    it "routes to #show" do
      expect(:get => "/aws_responses/1").to route_to("aws_responses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/aws_responses/1/edit").to route_to("aws_responses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/aws_responses").to route_to("aws_responses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/aws_responses/1").to route_to("aws_responses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/aws_responses/1").to route_to("aws_responses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/aws_responses/1").to route_to("aws_responses#destroy", :id => "1")
    end

  end
end
