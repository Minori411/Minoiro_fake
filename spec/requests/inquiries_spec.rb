require 'rails_helper'

RSpec.describe "Inquiries", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/inquiries/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/inquiries/confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /thanks" do
    it "returns http success" do
      get "/inquiries/thanks"
      expect(response).to have_http_status(:success)
    end
  end

end
