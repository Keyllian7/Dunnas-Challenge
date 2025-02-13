class AddCpfAndRgToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :rg, :string
    add_column :users, :cpf, :string
  end
end
