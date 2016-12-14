require "rails_helper"

RSpec.describe Weight, :type => :model do
	before(:each) do
		@weight = FactoryGirl.create(:weight)
	end

    it "should be the weight" do
    	expect(@weight.weight).to eq 50
    end
end