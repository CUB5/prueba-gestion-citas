class AddUserIdToClientes < ActiveRecord::Migration[8.0]
  def change
    add_reference :clientes, :user, foreign_key: true
  end
end
