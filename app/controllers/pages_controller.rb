class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:ajoke]
  skip_before_filter :verify_authenticity_token, only: [:contact, :album_request]
  def home
    gallery = Gallery.find(1)
    @pic = Picture.where(gallery_id: gallery).first
    @title = "Home"
  end

  def gallery
    @title = "Gallery"
  end

  def galleries
    @title = "Galleries"
    @gal = Gallery.where("id != 1")
    @gals = @gal.order(created_at: :desc)
    @galleries = @gals.paginate(:page => params[:page],:per_page => 6)
  end



  def packages
    @title = "Photography Packages"
  end

  def about
    @title = "About us"
  end

  def contact
    @title = "Contact us"
    if request.method == "POST"
      # if verify_recaptcha(:message => "Oh! It's error with reCAPTCHA!")
        message = { name: params[:name],
                    email: params[:email],
                    phone: params[:phone],
                    occation: params[:occation].presence || "Not provided",
                    date: params[:date].presence || "Not provided",
                    comments: params[:comments].presence || "Not provided"}

        if ClientMailer.enquiry(message).deliver_later
          ClientMailer.autoreply(message).deliver_later
          flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
        else
          flash.now[:error] = 'Technical issues.  Cannot send message.'
          render :contact
        end

      # else
      #   redirect_to request.referrer
      #   flash[:alert] = 'The captcha that was entered is incorrect, please try again.'
      # end
    end
  end

  def album_request
    @title = "Submit request for Album"
    if request.method == "POST"
      message = { name: params[:name],
                  email: params[:email],
                  phone: params[:phone],
                  files: params[:file_names]}
      if ClientMailer.reqAlbum(message).deliver_later
        ClientMailer.albumAutoreply(message).deliver_later
        flash.now[:notice] = 'We recieved your request. We will contact you soon!'
      else
        flash.now[:error] = 'Technical issues.  Please try later.'
        render :contact
      end

    end
  end

  def ajoke
    if current_user.admin?
      @title = "Admin Page"
    else
      sign_out_and_redirect(current_user)
    end
  end
end
