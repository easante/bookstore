class User < ActiveRecord::Base
  validates :email, :first_name, :last_name, presence: true

  has_secure_password

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
