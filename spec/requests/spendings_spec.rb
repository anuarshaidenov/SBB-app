require 'rails_helper'

RSpec.describe 'Spendings', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @type = Type.create name: 'Test type', icon: 'test.png', user: @user
      @spending = Spending.create name: 'Test spending', amount: 200, author: @user, type: @type

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get type_spendings_path(@type.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      expect(response.body).to include('Spendings')
      expect(response.body).to include('<ion-icon name="chevron-back-sharp"')
      expect(response.body).to include('Test spending')
    end
  end

  describe 'GET /new' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @type = Type.create name: 'Test type', icon: 'test.png', user: @user
      @spending = Spending.create name: 'Test spending', amount: 200, author: @user, type: @type

      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get new_type_spending_path(@type.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:new)
    end

    it 'renders correct content' do
      expect(response.body).to include('Add new spending')
      expect(response.body).to include('Name')
    end
  end
end
