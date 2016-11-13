class AddUserRefToDiaryEntries < ActiveRecord::Migration
  def change
    add_reference :diary_entries, :user, index: true, foreign_key: true
  end
end
