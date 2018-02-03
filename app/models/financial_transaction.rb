# frozen_string_literal: true

class FinancialTransaction < ApplicationRecord
  belongs_to :category

  validates :description, :date, :category_id, presence: true
  validates :amount, presence: true,
                     numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_type, presence: true, inclusion: { in: %w(W D R) }
end
