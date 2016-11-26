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
	# validates :product_barcode, :numericality => true, :uniqueness =>true
	has_and_belongs_to_many :ingredients
	has_many :allergens , through: :ingredients

	validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

	def self.search(search)
		if search
			p where("name LIKE ?", "%#{search}%").first.name
			# where("name LIKE ?", "%#{search}%").Allergen.all
			# results.each do |result|
			# 	result.allergens.first

		else
			# Food.all
			p "Search result not found"
		end
	end

	# def self.get_allergens()
	# 	self.allergens.each do |allergen|
	# 		p allergen.name
	# 	end
	# end

	# validates_each :product_barcode do |record, attr, value|
	# 	record.errors.add(attr, 'must be numerical value') if value =~ /[[:alpha:]]/
	# end
end
