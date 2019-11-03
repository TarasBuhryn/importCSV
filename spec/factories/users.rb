FactoryBot.define do
  factory :user do
  	first_name { Faker::Name.first_name }
  	last_name { Faker::Name.last_name }
  	email { Faker::Internet.email }
  	date_of_birth {Faker::Date.birthday}    
  end
end
