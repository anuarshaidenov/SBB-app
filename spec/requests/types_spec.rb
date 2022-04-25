require 'rails_helper'

RSpec.describe "Types", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/types/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/types/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/types/create"
      expect(response).to have_http_status(:success)
    end
  end

end
