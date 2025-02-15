require 'br_documents'

class Visitor < ApplicationRecord
  validates :name, presence: true
  validates :rg, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validates :telephone, presence: true
  validates :photo, presence: false
  
  mount_uploader :photo, PhotoUploader
  
  has_many :visits

  validate :validate_cpf
  
  def validate_cpf

    self.cpf = cpf.gsub(/\D/, '')

    unless BRDocuments::CPF.valid?(cpf)
      errors.add(:cpf, 'CPF inválido')
    end
  end
end
