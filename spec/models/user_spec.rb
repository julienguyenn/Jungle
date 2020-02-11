require 'rails_helper'


RSpec.describe User, type: :model do

  describe 'Validations' do
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
  
  
    it 'should be assigned a first name when creating a product' do
      @user=User.new(first_name:nil, last_name:'nguyen', email: 'julie-nguyen@live.com')
      expect(@user).to_not be_valid
    end

      
    it 'should be assigned a last name when creating a product' do
      @user=User.new(first_name:'julie', last_name:nil, email: 'julie-nguyen@live.com')
      expect(@user).to_not be_valid
    end

    it 'should be assigned an email when creating a product' do
      @user=User.new(first_name:'julie', last_name:'nguyen', email: nil)
      expect(@user).to_not be_valid
    end

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

  describe '.authenticate_with_credentials' do
    it 'should log the user in if authenticated' do
      @user = User.create(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyen@live.com', :password => '123', :password_confirmation => '123')
      @user.save
      expect(User.authenticate_with_credentials('julie-nguyen@live.com', '123')).to_not be_nil
    end

    it 'should log the user in if authenticated - case sensitive' do
      @user = User.create(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyen@live.com', :password => '123', :password_confirmation => '123')
      @user.save
      expect(User.authenticate_with_credentials('juLIe-nguyen@live.com', '123')).to_not be_nil
    end


    it 'should log the user in if authenticated - with spaces' do
      @user = User.create(:first_name => 'Julie', :last_name => 'Nguyen', :email => 'julie-nguyen@live.com', :password => '123', :password_confirmation => '123')
      @user.save
      expect(User.authenticate_with_credentials(' juLIe-nguyen@live.com ', '123')).to_not be_nil
    end
  end
end