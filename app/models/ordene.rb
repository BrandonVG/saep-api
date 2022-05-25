class Ordene < ApplicationRecord
  belongs_to :User, foreign_key: 'users_id'
  belongs_to :EstadosOrdene, foreign_key: 'estados_ordenes_id'
  has_many :ordenes_productos, foreign_key: 'ordenes_id'
  has_many :productos, through: :ordenes_productos, source: :producto
end
