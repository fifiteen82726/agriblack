class AddFruitListToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :fruitlist, :string
  end
end
