class AddCategorieToCategorieTransaktions < ActiveRecord::Migration[7.0]
  def change
    add_reference :categorie_transaktions, :categorie, null: false, foreign_key: true
  end
end
