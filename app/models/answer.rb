class Answer < ApplicationRecord
  validates_presence_of :body

  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
