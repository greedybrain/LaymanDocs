class User < ApplicationRecord
  include RailsJwtAuth::Authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  validates :email, presence: true,
                    uniqueness: true,
                    format: URI::MailTo::EMAIL_REGEXP
end
