class Sector < ApplicationRecord
  validates :name , presence: true,
    unit_id: presence: true

  belongs_to :unit
  has_many :visits
  has_many :users
end
