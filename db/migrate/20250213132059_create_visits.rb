class CreateVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :visits, id: :uuid do |t|
      t.references :visitor, null: false, foreign_key: true, type: :uuid
      t.references :unit, null: false, foreign_key: true, type: :uuid
      t.references :sector, null: false, foreign_key: true, type: :uuid
      t.datetime :date_time
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
