# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
class User < ApplicationRecord
  before_save :actions # to execute this actions before save
  #                     ⬇️ to delete all the elements who dependent on the user
  has_many :articles, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum:3, maximum:25}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum:105}, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  protected

  def actions
    self.email = email.downcase
    self.username = username.downcase.titleize
  end

end
