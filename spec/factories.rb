FactoryGirl.define do
	factory :user do
		username               "testUser"
        email                  "user@upenn.com"
        password               "password"
        password_confirmation  "password"
        confirmed_at = Time.now
    end

    factory :weight do
    	weight                 50
    	date = Date.today
    end

    factory :allergen do
        name                   "Egg"
    end

    factory :food do
        name                   "Oreo"
        product_barcode        1234
    end

    factory :ingredient do
        name                   "Milk"

    factory :diary_entry do
        food                  "Sushi"
        amount                123
    end
end