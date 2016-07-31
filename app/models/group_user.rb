class GroupUser < ApplicationRecord

  #slabi entitet za grupe i korisnike
  belongs_to :user
  belongs_to :group

end
