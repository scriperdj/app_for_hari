class ImagesController < ApplicationController
  layout 'image'

  def view_gallery
    @title = "View Gallery"
    @gallery = Gallery.find(params[:gallery])
    @image = Image.where(:gallery_id => @gallery)
    @photo = @image.order(created_at: :desc)
    @photos = @photo.paginate(:page => params[:page],:per_page => 6)
  end
end
