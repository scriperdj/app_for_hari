class AjokeController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_check

  def options
    @title = "Options"
    @gallery = Gallery.find(1)
    @pictures = @gallery.pictures.build
  end

  def save_cover
    @gallery = Gallery.find(1)
    p_attr = params[:picture]
    p_attr[:image] = params[:picture][:image].first if params[:picture][:image].class == Array

    unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(p_attr)
    @picture = @gallery.pictures.build(unlocked_params)
    if @picture.save
      respond_to do |format|
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def gallaries
    @title = "Gallaries"
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
