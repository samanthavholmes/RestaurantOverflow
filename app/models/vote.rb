class Vote < ApplicationRecord
  validates_presence_of :value

  belongs_to :user
  belongs_to :voteable, polymorphic: true
end
