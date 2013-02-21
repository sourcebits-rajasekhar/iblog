class User < ActiveRecord::Base
   attr_accessible :username, :email , :password ,:password_confirmation
   has_secure_password



   validates :username ,:presence =>true ,:length =>{:maximum => 50}
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email,:presence => true , :format  => {:with => VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => true } 
   validates :password , :password_confirmation , :presence =>true 
   validates :password , :length => {:minimum => 6 }

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
