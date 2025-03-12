class AddUsersRole < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :integer, default: 0 # 0 cliente, 1 medico, 2 admin
  end
end
