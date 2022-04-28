require 'rails_helper'

RSpec.describe 'SplashScreens', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      get root_path
      expect(response).to render_template(:index)
    end

    it "renders correct content" do
      get root_path
      expect(response.body).to include('Spendit')
      expect(response.body).to include('The budget app')
      expect(response.body).to include('sign in')
      expect(response.body).to include('sign up')
    end
  end
end
