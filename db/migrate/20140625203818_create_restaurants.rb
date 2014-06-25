class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :pricerange
      t.text :address
      t.string :cuisine
      t.text :summary
      t.string :capacity
      t.text :menu

      t.timestamps
    end
  end
end
