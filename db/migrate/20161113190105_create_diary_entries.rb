class CreateDiaryEntries < ActiveRecord::Migration
  def change
    create_table :diary_entries do |t|
      t.datetime :time
      t.string :meal
      t.string :food
      t.float :amount

      t.timestamps null: false
    end
  end
end
