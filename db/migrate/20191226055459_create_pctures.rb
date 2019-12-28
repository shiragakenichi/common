class CreatePctures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.integer :album_id
      t.date :date
      t.timestamps
    end
  end
end
