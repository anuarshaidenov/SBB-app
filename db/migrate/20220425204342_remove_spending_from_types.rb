class RemoveSpendingFromTypes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :types, :spending, null: false, foreign_key: true
  end
end
