class CreateFoodMeals < ActiveRecord::Migration
  def change
    create_table :food_meals do |t|
      t.integer :food_id
      t.integer :meal_id

      t.timestamps null: false
    end
  end
end
