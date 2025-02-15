class Visitor < ApplicationRecord
  validates :name, presence: true
  validates :rg, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validates :telephone, presence: true
  validates :photo, presence: false

  mount_uploader :photo, PhotoUploader

  has_many :visits
end
