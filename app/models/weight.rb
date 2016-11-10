# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  weight     :float
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Weight < ActiveRecord::Base
end
