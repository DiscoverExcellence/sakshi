class AddRefToMatch < ActiveRecord::Migration
  def change
    add_reference :matches, :tournament, index: true, foreign_key: true
  end
end
