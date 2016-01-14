class CreateEnqueries < ActiveRecord::Migration
  def change
    create_table :enqueries do |t|
      t.string :name
      t.string :email
      t.text :comments
      t.boolean :client

      t.timestamps null: false
    end
  end
end
