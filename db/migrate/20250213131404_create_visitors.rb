class CreateVisitors < ActiveRecord::Migration[8.0]
  def change
    create_table :visitors, id: :uuid do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :telephone
      t.string :photo

      t.timestamps
    end
  end
end
