json.extract! cita, :id, :cliente_id, :fecha, :hora_inicio, :numero_solicitado, :numero_realizados, :estado, :created_at, :updated_at
json.url cita_url(cita, format: :json)
