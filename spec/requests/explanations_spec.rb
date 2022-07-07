require 'rails_helper'

RSpec.describe "Explanations", type: :request do
  describe "GET /customer" do
    it "returns http success" do
      get "/explanations/customer"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /consultant" do
    it "returns http success" do
      get "/explanations/consultant"
      expect(response).to have_http_status(:success)
    end
  end
end
