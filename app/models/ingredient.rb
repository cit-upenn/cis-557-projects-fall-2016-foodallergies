# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_and_belongs_to_many :foods
  has_and_belongs_to_many :allergens
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
