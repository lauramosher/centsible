# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :deleted_at }
  validates :budget, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
