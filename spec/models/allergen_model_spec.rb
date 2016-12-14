require "rails_helper"

RSpec.describe Allergen, :type => :model do
	before(:each) do
		@allergen = FactoryGirl.create(:allergen)
	end

    it "should be the allergen" do
    	expect(@allergen.name).to eq "Egg"
    end
end