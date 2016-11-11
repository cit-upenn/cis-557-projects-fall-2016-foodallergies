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
	validates :name, :presence => true
	validates :product_barcode, :uniqueness =>true
	has_and_belongs_to_many :ingredients
	has_many :allergens , through: :ingredients

	validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
