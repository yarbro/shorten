class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.text :url, null: false

      t.timestamps
    end

    add_index :links, :name, unique: true
  end
end
