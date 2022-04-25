class AddTypesToSpendings < ActiveRecord::Migration[7.0]
  def change
    add_reference :spendings, :type, null: false, foreign_key: true
  end
end
