class User < ActiveRecord::Base

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true


  has_secure_password

  # authenticates the user's email and password
  def self.authenticate_with_credentials(email, password)

    #  removes the spaces in the email input
    email_remove_spaces = email.strip

    # puts it in lowercase to match the database
    email_downcase = email_remove_spaces.downcase

    # finds the email in the database
    user = User.find_by(email: email_downcase)
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end
  end
  
end
