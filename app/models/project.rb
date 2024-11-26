class Project < ApplicationRecord
  belongs_to :user
  has_many :donations
  # has_many :users, through: :donations

  validates :title, presence: true
  validates :description, presence: true
  validates :auditor, presence: true
  validates :progress, presence: true, numericality: { only_integer: true }
  validates :target, presence: true, numericality: { only_float: true }

  after_validation :geocode, if: :will_save_change_to_address?
  geocoded_by :address
end
