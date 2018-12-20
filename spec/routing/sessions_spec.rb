require "rails_helper"

RSpec.describe MediaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/login").to route_to("sessions#index")
    end
  end
end
