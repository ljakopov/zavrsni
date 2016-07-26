class Post < ApplicationRecord

  #post pripada jednom korisniku
  belongs_to :user

  has_many :comments
end
