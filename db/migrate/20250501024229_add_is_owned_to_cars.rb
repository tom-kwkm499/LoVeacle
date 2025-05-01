class AddIsOwnedToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :is_owned, :boolean, default: true
  end
end
