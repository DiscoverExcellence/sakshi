class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :venue
      t.date :played_on
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
