require 'br_documents'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

  mount_uploader :photo, PhotoUploader

  before_validation :sanitize_cpf

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :telephone, presence: true, phone: true
  validates :cpf, presence: true
  validates :rg, presence: true
  validates :photo, presence: true
  validates :unit_id, presence: false
  validates :sector_id, presence: false

  validate :validate_cpf

  enum :role, {employee: 0, attendant: 1, admin: 2}

  belongs_to :unit, optional: true
  belongs_to :sector, optional: true
  has_many :visits

  def validate_cpf
    unless BRDocuments::CPF.valid?(cpf)
      errors.add(:cpf, 'Invalid or null cpf')
    end
  end

  def sanitize_cpf
    self.cpf = cpf.gsub(/\D/, '')
  end

end
