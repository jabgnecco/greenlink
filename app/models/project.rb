class Project < ApplicationRecord
  belongs_to :user
  has_many :donations
  has_one_attached :photo
  # has_many :users, through: :donations

  validates :title, presence: true
  validates :description, presence: true
  validates :auditor, presence: true
  validates :progress, presence: true, numericality: { only_integer: true }
  validates :target, presence: true, numericality: { only_integer: true }

  after_validation :geocode, if: :will_save_change_to_address?
  geocoded_by :address

  def total
    donations_total = 0
    donations.each do |donation|
      donations_total += donation.amount
    end
    donations_total
  end
end
