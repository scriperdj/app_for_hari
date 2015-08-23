class Gallery < ActiveRecord::Base
  validates :name, :presence => true
  validates :event_date, :presence => true
  has_many :pictures, :dependent => :destroy
  has_many :images, :dependent => :destroy
  has_one :client

  private

  def gallery_params
      params.require(:gallery).permit(:cover, :desc, :name)
    end

end
