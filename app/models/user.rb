class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validate :password_correct
  validate :email_correct

  def password_correct
    return if password.present? && password.size >= 6
    errors.add(:password, "The password must be at least 6 characters long")
  end

  def email_correct
    return if email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    errors.add(:email, "is incorrect")
  end

end
