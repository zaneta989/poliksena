class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  belongs_to :user
  
  validates :title, presence: true,
            length: { minimum: 5 }
  acts_as_taggable_on :tags
  # like the post
  def like(user)
    likes << Like.new(user: user)
  end

  # unlike the post
  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end
  def previous_post
    Article.where(["id < ?", id]).last
  end

  def next_post
    Article.where(["id > ?", id]).first
  end
end
