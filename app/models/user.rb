class User < ActiveRecord::Base

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true


  has_secure_password

  def self.authenticate_with_credentials(email, password)
    email_remove_spaces = email.strip
    email_downcase = email_remove_spaces.downcase
    user = User.find_by(email: email_downcase)
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end
  end
  
end
