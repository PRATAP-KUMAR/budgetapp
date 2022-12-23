class CreateCategorieTransaktions < ActiveRecord::Migration[7.0]
  def change
    create_table :categorie_transaktions do |t|

      t.timestamps
    end
  end
end
