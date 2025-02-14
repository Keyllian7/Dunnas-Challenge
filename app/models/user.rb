class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  mount_uploader :photo, PhotoUploader

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :telephone, presence: true
  validates :cpf, presence: true
  validates :rg, presence: true
  validates :photo, presence: false
  validates :unit_id, presence: false
  validates :sector_id, presence: false

  enum :role, { employee: 0, attendant: 1, admin: 2 }

  belongs_to :unit, optional: true
  belongs_to :sector, optional: true
  has_many :visits
end
