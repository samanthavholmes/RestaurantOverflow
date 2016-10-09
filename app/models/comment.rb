class Comment < ApplicationRecord
  validates_presence_of :body

  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable
end
