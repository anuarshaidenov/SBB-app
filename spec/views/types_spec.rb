require 'rails_helper'

RSpec.describe 'Testing types views', type: :feature do
  describe 'types#index' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @type = Type.create name: 'Test type', icon: 'test.png', user: @user
      Type.create name: 'test 2', icon: 'test-2.png', user: @user
      @spending = Spending.create name: 'Test spending', amount: 200, author: @user, type: @type

      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on 'Log in'
    end

    it 'For each category, the user can see their name,
    icon and the total amount of all the transactions that belongs to that category.' do
      expect(page).to have_content 'Test type'
      expect(find_all('img')[0]['src']).to eq 'test.png'
      expect(page).to have_content('$200.0')
    end

    it 'When the user clicks (or taps) on a category item,
    the application navigates to the transactions page for that category.' do
      click_on 'Test type'
      expect(current_path).to eq type_spendings_path(@type.id)
    end

    it 'There is a button "add a new category" at the bottom
    that brings the user to the page to create a new category.' do
      click_on 'Add new type'
      expect(current_path).to eq new_type_path
    end
  end
end
