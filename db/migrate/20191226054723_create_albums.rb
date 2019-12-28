class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
