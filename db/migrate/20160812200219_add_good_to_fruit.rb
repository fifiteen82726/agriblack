class AddGoodToFruit < ActiveRecord::Migration
  def change
  	add_column :fruits, :advantage, :string 
  end
end
