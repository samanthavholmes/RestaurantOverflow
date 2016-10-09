class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}

  has_secure_password

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes, as: :voteable
end
