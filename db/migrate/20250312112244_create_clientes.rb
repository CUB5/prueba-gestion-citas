class CreateClientes < ActiveRecord::Migration[8.0]
  def change
    create_table :clientes do |t|
      t.string :codigo
      t.string :razon_social
      t.string :cif
      t.string :direccion
      t.string :municipio
      t.string :provincia
      t.date :fecha_inicio_contrato
      t.date :fecha_expiracion_contrato
      t.integer :numero_reconocimientos

      t.timestamps
    end
  end
end
