class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :amount, precision: 10, scale: 2, default: 0.0, null: false
      t.date :date

      t.timestamps
    end
  end
end
