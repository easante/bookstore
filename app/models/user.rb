class User < ActiveRecord::Base
  has_many :orders
  has_many :addresses

  validates :email, :first_name, :last_name, presence: true
  has_secure_password

  accepts_nested_attributes_for :addresses
  before_create :generate_token


  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def param
    token
  end

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
