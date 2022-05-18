class UserSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :email,
    :Nombre,
    :NumTelefono,
    :tipos_usuarios_id
  )
end
