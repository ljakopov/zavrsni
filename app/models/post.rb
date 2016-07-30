class Post < ApplicationRecord

  #post pripada jednom korisniku
  belongs_to :user

  has_many :comments

  mount_uploader :image, PostImageUploader

  acts_as_votable

end
