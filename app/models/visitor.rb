class Visitor < ApplicationRecord
    name: presence: true,
    email: presence: true, uniqueness: true,
    rg: presence: true, uniqueness: true
    cpf: presence: true, uniqueness: true
    telephone: presence: true
    photo: presence: true

    mount_uploader :photo, PhotoUploader

    has_many :visits
    
end
