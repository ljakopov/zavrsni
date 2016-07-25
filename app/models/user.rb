class User < ApplicationRecord
  has_secure_password

  #za spajanje frendships and users
  has_many :friendships
  has_many :friends, :through => :friendships


  #korisnik ima vise postova
  has_many :posts
end
