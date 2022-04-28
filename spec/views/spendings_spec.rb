require 'rails_helper'

RSpec.describe 'Testing spendings views', type: :feature do
  describe 'spendings#index' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @type = Type.create name: 'Test type', icon: 'test.png', user: @user
      (1..5).each { |i| Spending.create name: "Test spending #{i}", amount: 200, author: @user, type: @type }

      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on 'Log in'

      visit type_spendings_path(@type.id)
    end

    it 'For a given category, the list of transactions is presented, ordered by the most recent.' do
      expect(page).to have_content 'Test spending 1'
      expect(page).to have_content 'Test spending 2'
      expect(page).to have_content 'Test spending 3'
      expect(page).to have_content 'Test spending 4'
      expect(page).to have_content 'Test spending 5'
      expect(page).to_not have_content 'Test spending 6'
    end

    it 'At the top of the page the user could see the total amount for the category
    (sum of all of the amounts of the transactions in that category).' do
      expect(page).to have_content 'total amount spent $1000.0'
    end

    it 'There is a button "add a new transaction" at the
    bottom that brings the user to the page to create a new transaction' do
      click_on 'Add new spending'
      expect(current_path).to eq new_type_spending_path(@type.id)
    end

    # it 'When the user clicks on the "Back" button (<), the user navigates to the home page' do
    #   first(:button).click
    #   expect(current_path).to eq root_path
    # end
  end
end
