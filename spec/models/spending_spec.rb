require 'rails_helper'

RSpec.describe Spending, type: :model do
  describe 'Spending model' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @type = Type.create name: 'Test type', icon: 'test.png', user: @user
      @spending = Spending.create name: 'Test spending', amount: 200, author: @user, type: @type
    end

    it 'validates name' do
      @spending.name = ''

      expect(@spending).to_not be_valid
    end

    it 'validates amount' do
      @spending.amount = ''

      expect(@spending).to_not be_valid
    end

    it 'has a correct author' do
      expect(@spending.author).to eq @user
    end

    it 'has a correct type' do
      expect(@spending.type).to eq @type
    end
  end
end
