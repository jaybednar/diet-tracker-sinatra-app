class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :kcal

      t.timestamps null: false
    end
  end
end
