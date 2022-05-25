class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :tipos_usuarios_id, exclusion: [nil]
  has_many :ordenes, dependent: :destroy, foreign_key: 'users_id'
end
