require "rails_helper"

RSpec.describe Ingredient, :type => :model do
	before(:each) do
		@ingredient = FactoryGirl.create(:ingredient)
	end

    it "should be the food" do
    	expect(@ingredient.name).to eq "Milk"
    end
end