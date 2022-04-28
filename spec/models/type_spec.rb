require 'rails_helper'

RSpec.describe Type, type: :model do
  describe 'Type model' do
    before(:each) do
      @user = User.create name: 'Test', email: 'text@example.com', password: '123456'
      @type = Type.create name: 'Test type', icon: 'test.png', user: @user
    end

    it 'validates name' do
      @type.name = ''

      expect(@type).to_not be_valid
    end

    it 'validates icon' do
      @type.icon = ''

      expect(@type).to_not be_valid
    end

    it 'belongs to user' do
      expect(@type.user).to eq @user
    end
  end
end
