class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text    :text, null: false
      t.integer :user_id
      t.integer :item_id
      t.timestamps
    end
  end
end
