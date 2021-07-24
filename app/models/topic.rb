class Topic < ApplicationRecord
  has_many :posts
  has_many :participations
  has_many :users, through: :participations

  mount_uploader :picture, PictureUploader

  ransacker :users_count do
    query = '(SELECT COUNT(*) FROM `users` INNER JOIN `participations` ON `users`.`id` = `participations`.`user_id`
    where participations.topic_id = topics.id  group by participations.topic_id)'
    Arel.sql(query)
  end

  ransacker :latest_post_created_at do
    query = '(select created_at from posts where posts.topic_id=topics.id order by created_at desc limit 1)'
    Arel.sql(query)
  end
end
