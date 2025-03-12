json.extract! cliente, :id, :codigo, :razon_social, :cif, :direccion, :municipio, :provincia, :fecha_inicio_contrato, :fecha_expiracion_contrato, :numero_reconocimientos, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
