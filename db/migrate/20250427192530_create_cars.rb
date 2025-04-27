class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :user_id, null: false
      t.string :manufacturer, null: false
      t.string :car_name, null: false
      t.string :model_code
      t.string :trim_level

      t.timestamps
    end
  end
end
