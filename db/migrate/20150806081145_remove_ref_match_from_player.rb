class RemoveRefMatchFromPlayer < ActiveRecord::Migration
  def change
    remove_reference :players, :match, index: true, foreign_key: true
  end
end
