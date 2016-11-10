class AddUserRefToWeights < ActiveRecord::Migration
  def change
    add_reference :weights, :user, index: true, foreign_key: true
  end
end
