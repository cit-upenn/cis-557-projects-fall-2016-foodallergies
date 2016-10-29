# == Schema Information
#
# Table name: allergens
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Allergen < ActiveRecord::Base
	has_and_belongs_to_many :foods
end
