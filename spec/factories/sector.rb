FactoryBot.define do
    factory :sector do
      name { "Test Sector" }
      association :unit
    end
  end