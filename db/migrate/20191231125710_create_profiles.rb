class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :introduction
      t.string :gender
      t.string :prefectures
      t.string :age
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
