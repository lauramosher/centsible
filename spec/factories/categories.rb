# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name "MyString"
    budget 1.5

    trait :archived do
      deleted_at { Time.current }
    end
  end
end
