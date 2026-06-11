class CreateExpenseRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :expense_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.integer :amount, null: false
      t.date :spent_on, null: false
      t.integer :status, null: false, default: 0

      t.timestamps null: false
    end
  end
end
