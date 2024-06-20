class AddFavoritedToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :favorited, :boolean
  end
end
