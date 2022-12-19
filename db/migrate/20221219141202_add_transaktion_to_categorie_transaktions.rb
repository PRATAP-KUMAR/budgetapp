class AddTransaktionToCategorieTransaktions < ActiveRecord::Migration[7.0]
  def change
    add_reference :categorie_transaktions, :transaktion, null: false, foreign_key: true
  end
end
