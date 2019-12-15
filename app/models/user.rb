class User < ApplicationRecord
  require 'digest'
  validates :login, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :phone, length: {maximum: 9}
  has_many :opinions
  before_create -> {self.token = generate_token }
  before_create -> {self.password = Digest::SHA256.new << self.password }
  before_save -> {self.password = Digest::SHA256.new << self.password }

  private def generate_token
    loop do
      token = SecureRandom.hex
      return token unless User.exists?({token: token})
    end
  end

end
