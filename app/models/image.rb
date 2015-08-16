class Image < ActiveRecord::Base
  belongs_to :gallery
  mount_uploader :image, ImageUploader

  def to_jq_upload
    {
      files: [
        {
          id:   read_attribute(:id),
          name: read_attribute(:image),
          size: image.size,
          thumbnailUrl: image.thumb.url,
          url:  image.url
        }
      ]
    }
  end

end
