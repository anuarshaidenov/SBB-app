require 'rails_helper'

RSpec.describe "Spendings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/spendings/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/spendings/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/spendings/new"
      expect(response).to have_http_status(:success)
    end
  end

end
