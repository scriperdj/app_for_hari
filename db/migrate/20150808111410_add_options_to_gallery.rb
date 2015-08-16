class AddOptionsToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :enable_download, :boolean
    add_column :galleries, :download_pin, :int
    add_column :galleries, :enable_password, :boolean
    add_column :galleries, :password, :string
    add_column :galleries, :event_date, :date
  end
end
