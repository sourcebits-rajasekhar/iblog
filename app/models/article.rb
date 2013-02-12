class Article < ActiveRecord::Base
  attr_accessible :body, :title 
 
 validates :title,:body, :presence => true
 validates_uniqueness_of :title 
 
 has_many :comments , :dependent => :destroy
 
end
