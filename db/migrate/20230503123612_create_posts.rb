class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.text :title
      t.text :text
      t.date :createdat
      t.date :updatedat
      t.integer :commentscounter
      t.integer :likescounter

      t.timestamps
    end
  end
end
