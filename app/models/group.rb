class Group < ApplicationRecord
  #grupa pripada jednom korisniku
  belongs_to :user

  has_many :group_users, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :description
end
