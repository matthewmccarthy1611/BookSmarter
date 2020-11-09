class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.name = "Anonymous"
    user.password = Devise.friendly_token[0,20]
    end      
  end



  has_many :comments
  has_many :books, :through => :comments

  def self.most_books
    self.includes(:books).count
  end
end
