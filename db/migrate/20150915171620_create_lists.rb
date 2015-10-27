class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title,       null: false
      t.text :description,   null: false
      t.boolean :public
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
