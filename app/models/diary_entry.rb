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
#  user_id    :integer
#

class DiaryEntry < ActiveRecord::Base
	validates :food, :presence => true
	validates :amount, numericality: { greater_than: 0 }
	#validates :user_id, :presence => true
	belongs_to :user
end
