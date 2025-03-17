# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts "🛠 Eliminando datos existentes..."
Cita.destroy_all
Cliente.destroy_all
User.destroy_all

# Crear un administrador y un médico de prueba
puts "👤 Creando usuario admin y médico..."
admin = User.create!(email: "admin@admin.com", password: "admin1", role: :admin)
medico = User.create!(email: "medico@medico.com", password: "medico", role: :medico)

# Crear 1000 usuarios con clientes asociados
puts "👥 Generando 1000 usuarios y clientes..."
1000.times do |i|
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "contraseña",
    role: :cliente
  )

  Cliente.create!(
    user: user,
    codigo: Faker::Alphanumeric.alphanumeric(number: 8).upcase,
    razon_social: Faker::Company.name,
    cif: Faker::Alphanumeric.alphanumeric(number: 9).upcase,
    direccion: Faker::Address.street_address,
    municipio: Faker::Address.city,
    provincia: Faker::Address.state,
    fecha_inicio_contrato: Faker::Date.between(from: '2015-01-01', to: '2023-01-01'),
    fecha_expiracion_contrato: Faker::Date.between(from: '2024-01-01', to: '2030-01-01'),
    numero_reconocimientos: rand(1..20)
  )
end

# Obtener todos los clientes generados
clientes = Cliente.all

# Crear 30,000 citas distribuidas aleatoriamente entre los clientes
puts "📅 Generando 30,000 citas..."
30_000.times do
  cliente = clientes.sample
  fecha = Faker::Date.between(from: '2015-01-01', to: '2025-12-31')
  hora_inicio = Faker::Time.between(from: Time.parse("08:00"), to: Time.parse("18:00"))

  cliente.citas.create!(
    fecha: fecha,
    hora_inicio: hora_inicio,
    numero_solicitado: rand(1..5),
    numero_realizados: rand(0..5),
    estado: ["Pendiente", "Completada", "Cancelada"].sample
  )
end

puts "✅ ¡Base de datos poblada exitosamente!"
