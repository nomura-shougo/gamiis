class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  has_many :replies

  enumerize :post_type, in: {
    chat: 0,
    find_members: 1
  }, predicates: true, scope: true
end
