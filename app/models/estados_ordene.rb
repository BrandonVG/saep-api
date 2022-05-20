class EstadosOrdene < ApplicationRecord
  has_many :ordenes, foreign_key: 'estados_ordenes_id'
end
