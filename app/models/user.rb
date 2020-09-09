class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :tweets, dependent: :destroy
  validates :name, presence: true
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

         def already_liked?(tweet)
          self.likes.exists?(tweet_id: tweet.id)
        end

        protected
        def self.from_omniauth(access_token)
          data = access_token.info
          user = User.where(email: data['email']).first
    
          # Uncomment the section below if you want users to be created if they don't exist
          unless user
              user = User.create(name: data['name'],
                 email: data['email'],
                 password: Devise.friendly_token[0,20]
              )
          end
          user
        end
        

end
