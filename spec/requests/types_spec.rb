require 'rails_helper'

RSpec.describe 'Types', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @type = Type.create name: 'Test type', icon: 'test.png', user: @user
      @spending = Spending.create name: 'Test spending', amount: 200, author: @user, type: @type

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get root_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      expect(response.body).to include('Types')
      expect(response.body).to include('Test type')
      expect(response.body).to include('img src="test.png"')
      expect(response.body).to include('$200.0')
    end
  end

  describe 'GET /new' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @type = Type.create name: 'Test type', icon: 'test.png', user: @user
      @spending = Spending.create name: 'Test spending', amount: 200, author: @user, type: @type

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get new_type_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:new)
    end

    it 'renders correct content' do
      expect(response.body).to include('Add new type')
      expect(response.body).to include('Icon link')
      expect(response.body).to include('Name')
      expect(response.body).to include('Add new type')
    end
  end
end
