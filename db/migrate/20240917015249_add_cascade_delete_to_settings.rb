class AddCascadeDeleteToSettings < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :settings, :users
    add_foreign_key :settings, :users, on_delete: :cascade
  end
end
