class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :photo
      t.text :bio
      t.integer :postscounter

      t.timestamps
    end
  end
end
