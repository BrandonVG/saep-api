class Producto < ApplicationRecord
  has_many :OrdenesProducto
  has_many :Ordene, through: :OrdenesProducto
end
