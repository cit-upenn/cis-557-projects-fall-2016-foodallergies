# == Schema Information
#
# Table name: foods
#
#  id              :integer          not null, primary key
#  name            :string
#  product_barcode :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Food < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	has_and_belongs_to_many :ingredients
	has_many :allergens , through: :ingredients
end
