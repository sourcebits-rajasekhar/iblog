class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :body,:article_id,:user_id
  
  validates :article_id , :user_id ,:presence => true
  # validates :length => {:minimum =>5}
  
end
