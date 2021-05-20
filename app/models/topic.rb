class Topic < ApplicationRecord
  has_many :posts
  has_many :participations
  has_many :users, through: :participations
end
