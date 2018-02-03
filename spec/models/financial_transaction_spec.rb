# frozen_string_literal: true

require "rails_helper"

RSpec.describe FinancialTransaction, type: :model do
  describe "validations" do
    describe "description" do
      it "valid when present" do
        trans = build_stubbed(:financial_transaction, description: "Tripelroot")

        expect(trans).to be_valid
        expect(trans.errors).not_to be_added :description, :blank
      end

      it "invalid when blank" do
        trans = build_stubbed(:financial_transaction, description: nil)

        expect(trans).not_to be_valid
        expect(trans.errors).to be_added :description, :blank
      end
    end

    describe "category" do
      it "valid when present" do
        trans = build_stubbed(:financial_transaction, category: build_stubbed(:category))

        expect(trans).to be_valid
        expect(trans.errors).not_to be_added :category_id, :blank
      end

      it "invalid when blank" do
        trans = build_stubbed(:financial_transaction, category: nil)

        expect(trans).not_to be_valid
        expect(trans.errors).to be_added :category_id, :blank
      end
    end

    describe "amount" do
      it "valid when float" do
        trans = build_stubbed(:financial_transaction, amount: 10.0)

        expect(trans).to be_valid
        expect(trans.errors).not_to be_added :amount, :blank
      end

      it "valid when zeroed" do
        trans = build_stubbed(:financial_transaction, amount: 0.0)

        expect(trans).to be_valid
        expect(trans.errors).not_to be_added :amount, :blank
      end

      it "invalid when negative" do
        trans = build_stubbed(:financial_transaction, amount: -9.0)

        expect(trans).not_to be_valid
        expect(trans.errors).to be_added :amount, :greater_than_or_equal_to, count: 0
      end

      it "invalid when blank" do
        trans = build_stubbed(:financial_transaction, amount: nil)

        expect(trans).not_to be_valid
        expect(trans.errors).to be_added :amount, :blank
      end
    end

    describe "transaction_type" do
      it "valid when present" do
        trans = build_stubbed(:financial_transaction, transaction_type: "W")

        expect(trans).to be_valid
        expect(trans.errors).not_to be_added :transaction_type, :blank
      end

      it "valid when in included list" do
        trans = build_stubbed(:financial_transaction, transaction_type: "W")

        expect(trans).to be_valid
        expect(trans.errors).not_to be_added :transaction_type, :inclusion

        trans.transaction_type = "D"

        expect(trans).to be_valid
        expect(trans.errors).not_to be_added :transaction_type, :inclusion

        trans.transaction_type = "R"

        expect(trans).to be_valid
        expect(trans.errors).not_to be_added :transaction_type, :inclusion
      end

      it "invalid when missing" do
        trans = build_stubbed(:financial_transaction, transaction_type: nil)

        expect(trans).not_to be_valid
        expect(trans.errors).to be_added :transaction_type, :blank
      end

      it "invalid when not in included list" do
        trans = build_stubbed(:financial_transaction, transaction_type: "A")

        expect(trans).not_to be_valid
        expect(trans.errors).to be_added :transaction_type, :inclusion
      end
    end
  end
end
