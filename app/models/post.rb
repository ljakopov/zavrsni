class Post < ApplicationRecord

  #post pripada jednom korisniku
  belongs_to :user

end
