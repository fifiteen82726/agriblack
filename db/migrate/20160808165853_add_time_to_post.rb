class AddTimeToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :eat_time, :datetime
  end
end
