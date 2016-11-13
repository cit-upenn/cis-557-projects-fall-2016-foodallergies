json.extract! diary_entry, :id, :time, :meal, :food, :amount, :created_at, :updated_at
json.url diary_entry_url(diary_entry, format: :json)