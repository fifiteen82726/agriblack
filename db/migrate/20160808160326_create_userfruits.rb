class CreateUserfruits < ActiveRecord::Migration
  def change
    create_table :userfruits do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
