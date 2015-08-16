class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :desc
      t.string :image
      t.integer :gallery_id

      t.timestamps null: false
    end
  end
end
