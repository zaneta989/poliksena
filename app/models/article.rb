class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }
  acts_as_taggable_on :tags
  def previous_post
    Article.where(["id < ?", id]).last
  end

  def next_post
    Article.where(["id > ?", id]).first
  end
end
