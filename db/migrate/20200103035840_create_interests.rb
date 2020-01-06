class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :tag
      t.string :image
      t.string :imagelist
      t.timestamps
    end
  end
end
