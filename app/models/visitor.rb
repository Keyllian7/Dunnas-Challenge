require "br_documents"

class Visitor < ApplicationRecord
  before_validation :sanitize_cpf

  validates :name, presence: true
  validates :rg, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validates :telephone, presence: true, phone: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  has_many :visits

  validate :validate_cpf
  validate :validate_rg

  def validate_cpf
    unless BRDocuments::CPF.valid?(cpf)
      errors.add(:cpf, "Invalid cpf")
    end
  end

  def sanitize_cpf
    self.cpf = cpf.gsub(/\D/, "")
  end

  def validate_rg
    if !rg.match?(/\A\d{9}\z/)
      errors.add(:rg, "Invalid rg")
    end
    
  end 

end
