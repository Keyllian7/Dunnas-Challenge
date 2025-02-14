class ChangeTypeRoleInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :role, nil
    change_column :users, :role, :integer, using: 'role::integer'
    change_column_default :users, :role, 0
  end
end
