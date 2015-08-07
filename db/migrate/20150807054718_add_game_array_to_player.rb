class AddGameArrayToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :game_list, :integer, array: true
  end
end
