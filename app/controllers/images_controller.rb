class ImagesController < ApplicationController
  layout 'image'

  def view_gallery
    @title = "View Gallery"
    @gallery = Gallery.find(params[:gallery])
    @image = Image.where(:gallery_id => @gallery)
    #@photo = @image.order(created_at: :desc)

    @photos = @image.paginate(:page => params[:page],:per_page => 6)
    puts '>>>poto= ' + @photos.to_a.to_s
    rem = @photos.length % 6
    if (rem !=0 and rem < 4) 
      first = Image.find_by(id: @image.first.id)
      second = Image.find_by(id: @image.second.id)
      third = Image.find_by(id: @image.third.id)

      @photos = @photos << first
      @photos = @photos << second
      @photos = @photos << third

    end
  end
end
