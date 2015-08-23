class CreateClientGalleries < ActiveRecord::Migration
  def change
    create_table :client_galleries do |t|
      t.integer :gallery_id
      t.integer :client_id
      t.string :download_code

      t.timestamps null: false
    end
  end
end
