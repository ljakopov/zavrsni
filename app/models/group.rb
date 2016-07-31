class Group < ApplicationRecord

  #grupa pripada jednom korisniku
  belongs_to :user

  has_many :group_users

end
