class Tweet < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user

    has_many :likes ,dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :liked_tweets, through: :likes,source: :tweets
end