class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.string :name
      t.float :heat
      t.float :water
      t.float :protein
      t.float :fat
      t.float :carbohydrate
      t.float :fiber
      t.float :sugar
      t.float :na
      t.float :k
      t.float :ca
      t.float :mg
      t.float :fe
      t.float :zn
      t.float :p
      t.float :va
      t.float :ve
      t.float :vb
      t.float :vc

      t.timestamps null: false
    end
  end
end
