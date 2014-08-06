class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :cooking_time
      t.string :difficulty_level
      t.string :servings
      t.integer :food_type_id
      t.integer :food_preference_id
      t.integer :cuisine_id
      t.text :ingredients
      t.text :procedure
      t.integer :user_id

      t.timestamps
    end
    add_index :recipes, :user_id
  end
end
