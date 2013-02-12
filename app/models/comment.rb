class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :body, :email, :name , :article_id
  
  validates :email,:name, :article_id , :presence => true
  validates :name ,:length => {:minimum =>5}
end
