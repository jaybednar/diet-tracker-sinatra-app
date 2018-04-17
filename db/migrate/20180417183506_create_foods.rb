class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :serving_size
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :kcal

      t.timestamps null: false
    end
  end
end
