class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :content
      t.string :image
      t.integer :send_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
