class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  mount_uploader :photo, PhotoUploader

  validates :name presence: true,
    email: presence: true, uniqueness: true,
    role: presence: true,
    photo: presence: false
    telephone: presence: true
    cpf: presence: true
    rg: presence: true
    unit_id: presence: false
    sector_id: presence: false

  belongs_to :unit, optional: true
  belongs_to :sector, optional: true
  has_many :visits

end
