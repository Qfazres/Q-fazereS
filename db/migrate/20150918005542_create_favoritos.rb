class CreateFavoritos < ActiveRecord::Migration
  def change
    create_table :favoritos do |t|
      t.integer :user_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
