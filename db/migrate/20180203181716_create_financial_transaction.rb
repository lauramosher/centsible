class CreateFinancialTransaction < ActiveRecord::Migration[5.1]
  def change
    create_table :financial_transactions do |t|
      t.date :date, null: false
      t.string :description, null: false
      t.references :category, null: false, foreign_key: true
      t.float :amount, null: false, default: 0.0
      t.string :transaction_type, null: false
      t.float :balance

      t.timestamps
    end
  end
end
