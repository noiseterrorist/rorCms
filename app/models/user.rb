require 'digest/sha2'

class User < ActiveRecord::Base
  STATE_ACTIVE = 'A'
  STATE_NONACTIVE = 'N'

  belongs_to :role

  before_create :generate_activation_key, :set_state

  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true

  validate :password_must_be_present

  attr_accessor :password_confirmation
  attr_reader :password

  def User.encrypt_pass(password, salt)
    Digest::SHA2.hexdigest(password + '^&*678' + salt)
  end

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.pass = self.class.encrypt_pass(password, salt)
    end
  end

  private

		def generate_salt
			self.salt = self.object_id.to_s + rand.to_s
		end

		def password_must_be_present
			errors.add(:password, "Missing password") unless pass.present?
    end

    def generate_activation_key
      self.activation_key = Digest::SHA1.hexdigest(rand.to_s)
    end

    def set_state
      self.state = self.class::STATE_NONACTIVE
    end

end
