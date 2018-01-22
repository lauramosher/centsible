# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name "Bob"
    last_name "Builder"
    currency "USD"
    email "bob@builder.com"
    password "123456"
    password_confirmation "123456"
  end
end
