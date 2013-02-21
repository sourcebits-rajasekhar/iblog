class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :body, :email, :name , :article_id
  
  validates :email,:name, :article_id , :presence => true
  validates :name ,:length => {:minimum =>5}


  def self.createCommentWithUserId(params)
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    @comment.update_attributes(:user_id => current_user.id) if signed_in?  
  end 

  
end
