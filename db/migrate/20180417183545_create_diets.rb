class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :date
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :kcal
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
