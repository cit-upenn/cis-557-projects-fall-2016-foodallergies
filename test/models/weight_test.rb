# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  weight     :float
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class WeightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
