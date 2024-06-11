class RenameRestrictionsIdInProductRestrictions < ActiveRecord::Migration[7.1]
  def change
    rename_column :product_restrictions, :restrictions_id, :restriction_id
  end
end
