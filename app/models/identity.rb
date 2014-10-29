class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider, :access_token, :access_secret
end
