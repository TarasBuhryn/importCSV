FactoryBot.define do
  factory :import do
    title { Faker::Name.name }
    file { Faker::File.extension }
  end
end
