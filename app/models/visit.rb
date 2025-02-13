class Visit < ApplicationRecord
  validates :visitor_id: presence: true,
    unit_id: presence: true,
    sector_id: presence: true,
    user_id: presence: false
    date_time: presence: true,
    status: presence: true default: 0 

    enum: status: { scheduled: 0, completed: 1, cancelled: 2, rescheduled: 3, absent: 4 }

  belongs_to :visitor
  belongs_to :unit
  belongs_to :sector
  belongs_to :user, optional: true
end
