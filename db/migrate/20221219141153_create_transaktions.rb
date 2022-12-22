class CreateTransaktions < ActiveRecord::Migration[7.0]
  def change
    create_table :transaktions do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
