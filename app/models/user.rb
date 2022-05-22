class User < ApplicationRecord
  has_many :ordenes, dependent: :destroy, foreign_key: 'users_id'
end
