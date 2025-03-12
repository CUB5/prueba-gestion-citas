class CreateCitas < ActiveRecord::Migration[8.0]
  def change
    create_table :citas do |t|
      t.references :cliente, null: false, foreign_key: true
      t.date :fecha
      t.time :hora_inicio
      t.integer :numero_solicitado
      t.integer :numero_realizados
      t.string :estado

      t.timestamps
    end
  end
end
