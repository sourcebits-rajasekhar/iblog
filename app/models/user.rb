class User < ActiveRecord::Base
   attr_accessible :username, :email , :password ,:passwordconfirmation
   has_secure_password



   validates :username ,:presence =>true ,:length =>{:maximum => 50}
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email,:presence => true , :format  => {:with => VALID_EMAIL_REGEX }, :uniqueness => { :case_sensitive => true } 
   validates :password , :passwordconfirmation , :presence =>true 
   validates :password , :length => {:minimum => 6 }
end
