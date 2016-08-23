class Post < ApplicationRecord

  belongs_to :user

  has_many :comments

  mount_uploader :image, PostImageUploader

  acts_as_votable

  validates_presence_of :title, :image
end
