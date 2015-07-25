require 'rails_helper'

RSpec.describe AjokeController, type: :controller do

  describe "GET #options" do
    it "returns http success" do
      get :options
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #gallaries" do
    it "returns http success" do
      get :gallaries
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #clients" do
    it "returns http success" do
      get :clients
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #schedule" do
    it "returns http success" do
      get :schedule
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #notifications" do
    it "returns http success" do
      get :notifications
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #profile" do
    it "returns http success" do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end

end
