class ChangeRoleTypeInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :role, 0
  end
end
