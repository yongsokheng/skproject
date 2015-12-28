class AddOrderIdToProductions < ActiveRecord::Migration
  def change
    add_column :productions, :order_id, :integer
  end
end
