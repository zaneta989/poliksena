class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }
  acts_as_taggable_on :tags
end
