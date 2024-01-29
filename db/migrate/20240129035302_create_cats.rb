class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :description
      t.integer :age
      t.integer :price_per_day
      t.integer :user_id

      t.timestamps
    end
  end
end
