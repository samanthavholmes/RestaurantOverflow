class Comment < ApplicationRecord
  validates_presence_of :body

  belongs_to :user
  has_many :votes, as: :voteable
end
