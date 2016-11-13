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

class DiaryEntry < ActiveRecord::Base
	validates :food, :presence => true
	validates :amount, numericality: { greater_than: 0 }

	belongs_to :user
end
