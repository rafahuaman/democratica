class User < ActiveRecord::Base
  has_many :rallies
  has_one :identity
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, on: :update, allow_blank: true
  validates :password, length: { minimum: 6 }, on: :create, allow_blank: false
  has_secure_password
   
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def tweet(tweet)
    TwitterAdapter.tweet(tweet, identity.access_token, identity.access_secret)
  end

  def support(rally)
    
  end

  private
  
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
