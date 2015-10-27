class AddComnpletedToSubItem < ActiveRecord::Migration
  def change
    add_column :sub_items, :completed, :boolean, default: false
  end
end
