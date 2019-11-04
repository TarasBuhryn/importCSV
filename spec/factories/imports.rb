# frozen_string_literal: true

FactoryBot.define do
  factory :import do
    title { Faker::Name.name }
    file { File.open(File.join(Rails.root, 'public/uploads/import/file/1/500_users.csv')) }
  end
end
