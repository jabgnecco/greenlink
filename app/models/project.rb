class Project < ApplicationRecord
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

  def names
    random_names =
    ["Jaime Barros",
    "Alvin Baldwin",
    "Braylen Nielsen",
    "Juliet Conrad",
    "Nico Repetto",
    "Roland Ralte",
    "Theodore Bischoff",
    "Roland Lalhruaizela",
    "Iliana Sawyer",
    "Angelo Roth",
    "Averi Mclaughlin",
    "Bobby Gonzalez",
    "Kaden Frank",
    "Peyton Chan",
    "Audrey Yates",
    "Jacob Kline"]
    return random_names.sample
  end

  def top_donation
    return (90000..1000000).to_a.sample
  end

  def recent_donation
    return (10000..89999).to_a.sample
  end
end
