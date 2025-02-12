class CreateUnits < ActiveRecord::Migration[8.0]
  def change
    create_table :units, id: :uuid do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
