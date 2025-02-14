class CreateSectors < ActiveRecord::Migration[8.0]
  def change
    create_table :sectors, id: :uuid do |t|
      t.string :name
      t.references :unit, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
