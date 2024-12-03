class Project < ApplicationRecord
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
  CONTINENTS = ["Africa", "Antarctica", "Asia", "Oceania", "Europe", "North America", "South America"]

  belongs_to :user
  has_many :donations, dependent: :destroy
  # has_many :users, through: :donations
  has_many :categories, dependent: :destroy
  accepts_nested_attributes_for :categories

  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :auditor, presence: true
  validates :progress, presence: true, numericality: { only_integer: true }
  validates :target, presence: true, numericality: { only_integer: true }
  validates :name, inclusion: { in: ENERGY_TYPES}
  validates :region, inclusion: { in: CONTINENTS}
  after_validation :geocode, if: :will_save_change_to_address?
  geocoded_by :address



  def total
    donations_total = 0
    donations.each do |donation|
      donations_total += donation.amount
    end
    donations_total
  end


  def display_categories
    formatted_categories = categories.map do |category|
      category.name
    end.join(" ")
    return formatted_categories
  end

  def top_donation
    return donations.order(amount: :desc).first
  end

  def recent_donation
    return donations.order(created_at: :desc).first
  end
end
