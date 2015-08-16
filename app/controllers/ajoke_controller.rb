class AjokeController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!
  before_action :admin_check

  def options
    @title = "Options"
    @gallery = Gallery.find(1)
    @pictures = @gallery.pictures.build
  end

  def save_cover
    @gallery = Gallery.find(1)
    @pic = Picture.where(gallery_id: @gallery).first
    p_attr = params[:picture]
    p_attr[:image] = params[:picture][:image].first if params[:picture][:image].class == Array

    unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(p_attr)
    #@picture = @gallery.pictures.build(unlocked_params)

    if @pic.update_attributes(unlocked_params)
      respond_to do |format|
        format.html {
          render :json => @pic.to_jq_upload,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => @pic.to_jq_upload
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def create_gallery
    name = params[:name]
    date =  Date.strptime(params[:event_date], "%m/%d/%Y")
    puts 'name=' + name +  '  date=' + date.to_s
    @gallery = Gallery.new(name: name, event_date: date)

    if @gallery.save
      redirect_to ajoke_upload_images_path(:gallery => @gallery)
    else
      render :galleries
    end
  end

  def upload_images
    @gallery = Gallery.find(params[:gallery])
    @image = Image.where(:gallery_id => @gallery)
    @photo = @image.order(created_at: :desc)
    @photos = @photo.paginate(:page => params[:page],:per_page => 6)
    @title = "Upload images to " + @gallery.name
  end

  def uploaded_images
    @image = Image.where(:gallery_id => params[:gallery])
    @photo = @image.order(created_at: :desc)
    @photos = @photo.paginate(:page => params[:page],:per_page => 6)
    render :partial => "uploaded_images"
  end

  def update_cov
    img_id = params[:img]
    gal_id = params[:gal]
    gal = Gallery.find(gal_id)
    gal.cover = img_id
    if gal.save
      render :json => 'success'
    end
  end

  def save_images
    p_attr = params[:image]
    #puts '>>>atrs=' + p_attr.to_s
    p_attr[:image] = params[:image][:image].first if params[:image][:image].class == Array
    unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(p_attr)

    @images = Image.new(unlocked_params)

    if @images.save
      respond_to do |format|
        format.html {
          render :json => @images.to_jq_upload,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => @images.to_jq_upload
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end

  end

  def galleries
    @gallery = Gallery.new
    @title = "Galleries"
    @gal = Gallery.where("id != 1")
    @gals = @gal.order(created_at: :desc)
    @galleries = @gals.paginate(:page => params[:page],:per_page => 6)
  end

  def clients
    @title = "Clients"
  end

  def schedule
    @title = "Schedule"
  end

  def notifications
    @title = "Nitifications"
  end

  def profile
    @title = "Profile"
  end

  private

    def admin_check
      unless current_user.admin?
        sign_out_and_redirect(current_user)
      end
    end
end
