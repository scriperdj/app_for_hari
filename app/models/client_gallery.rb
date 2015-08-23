class ClientGallery < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :client
  validates :gallery_id, :uniqueness => {:scope => :client}
end
