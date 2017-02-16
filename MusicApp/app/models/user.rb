# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :password_digest, :session_token, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  before_validation :ensure_session_token
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def password=(password)
    self.password = password
    self.password_digest = Bycrpt::Password.create(password)
    self.save!
  end

  def reset_session_token
    self.session_token = User.generate_session_token
  end

  def is_password?(password)
    Bycrpt::Password.new(self.password_digest) == password
  end

  def self.find_by_user_credentials(email, password)
    user = User.find_by_email(email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

end
