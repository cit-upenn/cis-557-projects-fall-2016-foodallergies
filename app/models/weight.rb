# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  weight     :float
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Weight < ActiveRecord::Base
    validates :weight, :presence => true, numericality: { greater_than: 0 }
	belongs_to :user
end
