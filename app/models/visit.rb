class Visit < ApplicationRecord
  validates :visitor_id, presence: true
  validates :unit_id, presence: true
  validates :sector_id, presence: true
  validates :user_id, presence: false
  validates :date_time, presence: true
  validates :status, presence: true

  validate :date_time_is_not_in_the_past

  enum :status, {pending: 0, completed: 1, absent: 2}

  belongs_to :visitor
  belongs_to :unit
  belongs_to :sector
  belongs_to :user, optional: true

  def date_time_is_not_in_the_past
    if date_time.present? && date_time < Time.current
      errors.add(:date_time, "the visit cannot be on a past date")
    end
  end
end
