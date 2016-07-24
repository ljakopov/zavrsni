class User < ApplicationRecord
  has_secure_password

  #korisnik ima vise postova
  has_many :posts
end
