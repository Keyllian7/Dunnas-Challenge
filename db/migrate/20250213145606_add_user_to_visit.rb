class AddUserToVisit < ActiveRecord::Migration[8.0]
  def change
    add_reference :visits, :user, null: false, foreign_key: true, type: :uuid
  end
end
