class Category < ApplicationRecord
  ENERGY_TYPES = [
    "Solar Energy",
    "Wind Energy",
    "Hydropower",
    "Mixed Energy",
    "Solar Energy",
    "Solar Energy",
    "Electric",
    "Bionergy",
    "Solar Energy",
    "Biogas",
    "Wind Energy",
    "Hydropower",
    "Wind Energy",
    "Hydropower",
    "Solar Energy"
  ]
  validates :name, inclusion: { in: ENERGY_TYPES}
  belongs_to :project
end
