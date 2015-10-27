class CreateSubItems < ActiveRecord::Migration
  def change
    create_table :sub_items do |t|
      t.string :description
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
