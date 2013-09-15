class Comment < ActiveRecord::Base
  belongs_to :article
  validates :body, :presence => { :message => "body cannot be blank" }
end
