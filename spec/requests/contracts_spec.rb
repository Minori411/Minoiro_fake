require 'rails_helper'

RSpec.describe "Contracts", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/contracts/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /shop" do
    it "returns http success" do
      get "/contracts/shop"
      expect(response).to have_http_status(:success)
    end
  end

end
