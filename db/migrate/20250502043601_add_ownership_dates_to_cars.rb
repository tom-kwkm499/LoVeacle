class AddOwnershipDatesToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :ownership_start_date, :date
    add_column :cars, :ownership_end_date, :date
  end
end
