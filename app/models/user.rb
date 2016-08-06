class User < ApplicationRecord
  has_secure_password

  #za spajanje frendships and users
  has_many :friendships
  has_many :friends, :through => :friendships


  #korisnik ima vise postova
  has_many :posts

  #korisnik ima vise komentara
  has_many :comments

  #korisnik može kreirati više grupa
  has_many :groups

  has_many :group_users
  mount_uploader :image, UserImageUploader

  has_many :activities

  acts_as_voter

end
