class Project < ApplicationRecord
  has_many :donations
  has_many :users, through: :donations
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :auditor, presence: true
  validates :progress, presence: true, numericality: { only_integer: true }
  validates :target, presence: true, numericality: { only_float: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
