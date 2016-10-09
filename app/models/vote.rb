class Vote < ApplicationRecord
  validates_presence_of :value

  belongs_to :user
end
