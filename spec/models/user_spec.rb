require 'rails_helper'


RSpec.describe User, type: :model do

  describe 'Validations' do
    describe '#password_digest' do
      it 'should be valid with a correct password' do
        @user = User.new(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyen@live.com', :password => '123', :password_confirmation => '123')
        expect(@user).to be_valid
      end

      it 'should not be valid an incorrect password' do
        @user = User.new(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyen@live.com', :password => '123', :password_confirmation => '456')
        expect(@user).to_not be_valid
      end
    end

    describe '#email' do
      it 'should not create a user with an existing email' do
        @user1 = User.new(:email => 'julie-nguyeN@live.com', :password => '456')
        @user1.save!
        @user2 = User.new(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyeN@live.com', :password => '123', :password_confirmation => '123')
        expect(User.where(email: 'julie-nguyen@live.com')).to exist
      end
    end
  end
end