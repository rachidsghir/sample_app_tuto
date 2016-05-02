class User < ActiveRecord::Base

  #Contants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\.-_]+\.[a-z]+\z/i

  #Validations
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255},format: {with: VALID_EMAIL_REGEX, message: "You should enter a valid email"},uniqueness: {case_sensitive: false, message:"this email has already existed, try with another email"}

end
