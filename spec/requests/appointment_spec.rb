require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/appointment/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/appointment/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/appointment/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/appointment/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/appointment/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
