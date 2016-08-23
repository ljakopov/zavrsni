class User < ApplicationRecord

  attr_accessor :activation_token

  before_create :create_activation_digest
  has_secure_password

  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :email
  validates_length_of :email, maximum: 255
  validates_length_of :username, minimum: 5
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

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

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
