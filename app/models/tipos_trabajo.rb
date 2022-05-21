class TiposTrabajo < ApplicationRecord
  has_many :ordenes, foreign_key: 'tipos_trabajos_id'
end
