class Gallery < ActiveRecord::Base

  has_many :pictures, :dependent => :destroy

  private

  def gallery_params
      params.require(:gallery).permit(:cover, :desc, :name)
    end

end
