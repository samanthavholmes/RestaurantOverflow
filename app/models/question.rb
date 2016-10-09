class Question < ApplicationRecord
  validates_presence_of :title, :body

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
