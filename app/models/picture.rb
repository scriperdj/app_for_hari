class Picture < ActiveRecord::Base
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  belongs_to :gallery
  mount_uploader :image, CoverUploader
  #validates :image, :presence => true

  def create
    @picture = Picture.new(picture_params)
  end
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


  private

  def picture_params
      params.require(:picture).permit(:gallery_id, :image, :crop_x, :crop_y, :crop_w, :crop_h)
  end

end
