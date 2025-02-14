class Visit < ApplicationRecord
  validates :visitor_id, presence: true
  validates :unit_id, presence: true
  validates :sector_id, presence: true
  validates :user_id, presence: false
  validates :date_time, presence: true
  validates :status, presence: true

  belongs_to :visitor
  belongs_to :unit
  belongs_to :sector
  belongs_to :user, optional: true
end
