# == Schema Information
#
# Table name: diary_entries
#
#  id         :integer          not null, primary key
#  time       :datetime
#  meal       :string
#  food       :string
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DiaryEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
