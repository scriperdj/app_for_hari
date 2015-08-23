class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.integer :phone_no
      t.string :city

      t.timestamps null: false
    end
  end
end
