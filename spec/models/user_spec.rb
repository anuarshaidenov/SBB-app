require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User model" do
    before (:each) do
      @user = User.create name: "Test", email: "text@example.com", password: "123456"
    end

    it "validates name" do
      @user.name = ''
      expect(@user).to_not be_valid
    end
  end
end
