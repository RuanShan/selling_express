require "rails_helper"

RSpec.describe MwsRequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mws_requests").to route_to("mws_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/mws_requests/new").to route_to("mws_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/mws_requests/1").to route_to("mws_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mws_requests/1/edit").to route_to("mws_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mws_requests").to route_to("mws_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mws_requests/1").to route_to("mws_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mws_requests/1").to route_to("mws_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mws_requests/1").to route_to("mws_requests#destroy", :id => "1")
    end

  end
end
