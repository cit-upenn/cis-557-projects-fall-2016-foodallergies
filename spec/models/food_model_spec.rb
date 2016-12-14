require "rails_helper"

RSpec.describe Food, :type => :model do
	before(:each) do
		@food = FactoryGirl.create(:food)
	end

    it "should be the food" do
    	expect(@food.name).to eq "Oreo"
    end
end