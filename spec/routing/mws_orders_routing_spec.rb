require "rails_helper"

RSpec.describe MwsOrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mws_orders").to route_to("mws_orders#index")
    end

    it "routes to #new" do
      expect(:get => "/mws_orders/new").to route_to("mws_orders#new")
    end

    it "routes to #show" do
      expect(:get => "/mws_orders/1").to route_to("mws_orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mws_orders/1/edit").to route_to("mws_orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mws_orders").to route_to("mws_orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mws_orders/1").to route_to("mws_orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mws_orders/1").to route_to("mws_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mws_orders/1").to route_to("mws_orders#destroy", :id => "1")
    end

  end
end
