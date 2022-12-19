class AddUserToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :author, null: false, foreign_key:{to_table: :users}
  end
end
