class UserSerializer < ActiveModel::Serializer
  
  attributes(
    :id,
    :email,
    :tipos_usuarios_id
  )
  has_many :ordenes
end
