class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.text :name
      t.text :photo
      t.text :bio
      t.date :createdat
      t.date :updatedat
      t.integer :postscounter

      t.timestamps
    end
  end
end
