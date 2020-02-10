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

  
      it 'should have a password length of atleast 2' do
      end
    end
    
    describe '#first_name' do
      it 'should be assigned a first name when creating a product' do
        @user=User.new(first_name:nil, last_name:'nguyen', email: 'julie-nguyen@live.com')
        expect(@user).to_not be_valid
      end
    end

    describe '#email' do
      it 'cannot create a user with the same email' do
        @user = User.create(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyen@live.com', :password => '123', :password_confirmation => '123')

        @user2 = User.create(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyen@live.com', :password => '123', :password_confirmation => '123')
        expect(@user).to be_valid
        expect(@user2).to_not be_valid
      end

      it 'cannot create a user with the same email - not case sensitive' do
        @user = User.create(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nGUYEn@live.com', :password => '123', :password_confirmation => '123')

        @user2 = User.create(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyen@live.com', :password => '123', :password_confirmation => '123')
        
        expect(@user2).to_not be_valid
      end
    end
  end
end