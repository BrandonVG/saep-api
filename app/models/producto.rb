class Producto < ApplicationRecord
  has_many :ordenes_productos, foreign_key: 'productos_id'
  has_many :ordenes, through: :ordenes_productos, source: :ordene
end
