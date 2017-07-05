class Like < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  ## We make sure that one user can only have one like per post
  validates :user_id, uniqueness: {scope: :article_id}
end