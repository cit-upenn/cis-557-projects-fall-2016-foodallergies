require "rails_helper"

RSpec.describe Food, :type => :model do
	before(:each) do
		@food = FactoryGirl.create(:food)
	end

    it "should be the food" do
    	expect(@food.name).to eq "Oreo"
    end

    it "should be able to search with name" do
    	search = Food.search("Oreo")
    	expect(search).not_to be_nil
    end

    it "should not find the search result" do
    	search = Food.search(nil)
    	expect(search).not_to be_nil
    end
end