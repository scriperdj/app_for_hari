class ChangePhoneNoFormatInClients < ActiveRecord::Migration
  def change
    change_column :clients, :phone_no, :string
  end
end
