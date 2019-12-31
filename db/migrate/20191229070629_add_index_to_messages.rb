class AddIndexToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :efect_id, :integer
  end
end
