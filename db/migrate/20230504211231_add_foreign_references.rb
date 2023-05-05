class AddForeignReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
    add_reference :comments, :post, null: false, foreign_key: { to_table: :posts, on_delete: :cascade }
    
    add_reference :likes, :author, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
    add_reference :likes, :post, null: false, foreign_key: { to_table: :posts, on_delete: :cascade }
    
    add_reference :posts, :author, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
  end
end
