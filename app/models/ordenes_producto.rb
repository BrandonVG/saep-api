class OrdenesProducto < ApplicationRecord
  belongs_to :ordene, foreign_key: 'ordenes_id'
  belongs_to :producto, foreign_key: 'productos_id'
end
