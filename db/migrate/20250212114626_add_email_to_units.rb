class AddEmailToUnits < ActiveRecord::Migration[8.0]
  def change
    add_column :units, :email, :string
  end
end
