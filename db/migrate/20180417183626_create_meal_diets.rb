class CreateMealDiets < ActiveRecord::Migration
  def change
    create_table :meal_diets do |t|
      t.integer :meal_id
      t.integer :diet_id

      t.timestamps null: false
    end
  end
end
