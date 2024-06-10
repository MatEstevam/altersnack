class CreateProductRestrictions < ActiveRecord::Migration[7.1]
  def change
    create_table :product_restrictions do |t|
      t.references :restrictions, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
