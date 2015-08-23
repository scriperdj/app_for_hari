class CreateGalleryDownloads < ActiveRecord::Migration
  def change
    create_table :gallery_downloads do |t|
      t.string :gallery_id
      t.string :user_email
      t.string :download_count

      t.timestamps null: false
    end
  end
end
