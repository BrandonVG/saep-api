class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_many :ordenes, dependent: :destroy, foreign_key: 'users_id'
end
