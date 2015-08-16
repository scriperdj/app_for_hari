require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

  describe "GET #upload_images" do
    it "returns http success" do
      get :upload_images
      expect(response).to have_http_status(:success)
    end
  end

end
