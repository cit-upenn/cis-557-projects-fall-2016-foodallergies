# == Schema Information
#
# Table name: diary_entries
#
#  id         :integer          not null, primary key
#  food       :string
#  amount     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DiaryEntry < ActiveRecord::Base
	has_and_belongs_to_many :allergens
end
