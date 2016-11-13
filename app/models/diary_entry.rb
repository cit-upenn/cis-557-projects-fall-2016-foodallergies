class DiaryEntry < ActiveRecord::Base
	validates :food, :presence => true
	validates :amount, numericality: { greater_than: 0 }
end
