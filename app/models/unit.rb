class Unit < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    has_many :sectors
    has_many :visits
    has_many :users
end
