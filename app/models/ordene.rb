class Ordene < ApplicationRecord
  belongs_to :User
  belongs_to :TiposTrabajo
  belongs_to :EstadosOrdene
end
