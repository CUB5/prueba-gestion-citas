# README

Proyecto Rails: Gestión de Citas Médicas

Este proyecto es una aplicación web desarrollada en Ruby on Rails 8 para gestionar usuarios, clientes y citas médicas, con roles de admin, médico y usuario.

Dependencias:
* Ruby version: 3.3.0
* System dependencies: rbenv
* Database: sqlite3

# Instalar rbenv y Ruby 3.3.0 (en Linux/macOS)
- sudo apt install rbenv  # Ubuntu/Debian

- brew install rbenv      # macOS

- rbenv install 3.3.0

- rbenv global 3.3.0

# Instalar Bundler y Rails
- gem install bundler

- bundle install

- rails db:migrate

- rails db:seed
 Se cargaran los datos de: 
    - usuarios aleatorios, email aleatorios con contraseña "contraseña"
    - admin, con email admin@admin.com y contraseña "admin1"
    - medico, con email medico@medico.com y contraseña "medico"

- rails server o bin/dev
