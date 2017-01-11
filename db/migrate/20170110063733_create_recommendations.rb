class CreateRecommendations < ActiveRecord::Migration[5.0]
  def change
    create_table :recommendations do |t|
      t.string :name, :null => false
      t.string :cuisine, :null => false
      t.string :location, :null => false
      t.text :description
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
