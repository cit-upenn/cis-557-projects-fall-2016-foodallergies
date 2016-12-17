require "rails_helper"

RSpec.describe User, :type => :model do
	before(:each) do
		@user = FactoryGirl.create(:user)
	end

    it "should be the testUser" do
    	expect(@user.username).to eq "testUser"
    end

end