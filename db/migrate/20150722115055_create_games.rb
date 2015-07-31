class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :scoring_pts
      t.string :description

      t.timestamps null: false
    end
  end
end
