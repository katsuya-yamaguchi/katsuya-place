require "rails_helper"

RSpec.describe MediaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/login").to route_to("sessions#index")
    end
    it "routes to #create" do
      expect(:post => "/login").to route_to("sessions#create")
    end
    it "routes to #destroy" do
      expect(:delete => "/login").to route_to("sessions#destroy")
    end
  end
end
