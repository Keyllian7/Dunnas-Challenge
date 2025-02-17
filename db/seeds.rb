# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.where(email: "keyllianazevedo2@gmail.com").first_or_initialize
user.update!(
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.now,
  role: 2,
  cpf: "24327784052", # CPF gerado pelo site https://www.4devs.com.br/gerador_de_cpf
  rg: "123456789",
  name: "Keyllian Azevedo",
  telephone: "55 92 36170584", # Telefone gerado pelo site https://geradornv.com.br/gerador-telefone/
)
