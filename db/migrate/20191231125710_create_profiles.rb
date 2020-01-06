class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :introduction
      t.string :gender
      t.string :prefectures
      t.string :birth_year
      t.string :birth_month
      t.string :birth_day
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
