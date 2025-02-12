class Unit < ApplicationRecord
    has_many :sectors
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
