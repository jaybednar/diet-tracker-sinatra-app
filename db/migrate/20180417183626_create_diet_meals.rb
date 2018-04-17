class CreateDietMeals < ActiveRecord::Migration
  def change
    create_table :diet_meals do |t|
      t.integer :meal_id
      t.integer :diet_id

      t.timestamps null: false
    end
  end
end
