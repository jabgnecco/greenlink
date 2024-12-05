class Category < ApplicationRecord
  ENERGY_TYPES = [
    "☀️ Solar Energy",
    "💨 Wind Energy",
    "💧 Hydropower",
    "🍃 Mixed Energy",
    "💡 Electric",
    "♻️ Bionergy",
    "🌫️ Biogas"
  ]
  validates :name, inclusion: { in: ENERGY_TYPES}
  belongs_to :project
end
