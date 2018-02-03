
# frozen_string_literal: true

FactoryBot.define do
  factory :financial_transaction do
    date { Date.new }
    description "Tripelroot"
    amount 20.0
    transaction_type "W"
    balance 20.0

    category
  end
end
