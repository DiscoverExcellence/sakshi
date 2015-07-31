class AddRefToPlayer < ActiveRecord::Migration
  def change
    add_reference :players, :match, index: true, foreign_key: true
  end
end
