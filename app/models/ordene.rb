class Ordene < ApplicationRecord
  belongs_to :users
  belongs_to :TiposTrabajo
  belongs_to :EstadosOrdene
end
