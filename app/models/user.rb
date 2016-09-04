class User < ApplicationRecord
  attr_accessor :activation_token

  before_create :create_activation_digest
  has_secure_password

  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_presence_of :username, on: :create
  validates_presence_of :email, on: :create
  validates_length_of :email, maximum: 255
  validates_length_of :username, minimum: 5
  #validates_length_of :password, minimum: 5, on: :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :dependent => :destroy

  has_many :posts, :dependent => :destroy

  has_many :comments, :dependent => :destroy

  has_many :groups, :dependent => :destroy

  has_many :group_users, :dependent => :destroy

  mount_uploader :image, UserImageUploader

  has_many :activities, :dependent => :destroy

  acts_as_voter

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def last_time_login(user)
    Activity.where(user_id:user.id,trackable_type:"User", action:"attempt_login").last.created_at
  end

  def self.search(search)
    where("username LIKE ?", "%#{search}%")
  end
  private

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
