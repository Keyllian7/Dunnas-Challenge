class Sector < ApplicationRecord
  validates :name , presence: true
  validates :unit_id, presence: true

  belongs_to :unit
  has_many :visits
  has_many :users
end
