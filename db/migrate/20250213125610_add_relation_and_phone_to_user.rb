class AddRelationAndPhoneToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :telephone, :string
    add_reference :users, :unit, null: true, foreign_key: true, type: :uuid
    add_reference :users, :sector, null: true, foreign_key: true, type: :uuid
  end
end
