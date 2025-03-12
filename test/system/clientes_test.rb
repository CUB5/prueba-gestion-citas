require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "should create cliente" do
    visit clientes_url
    click_on "New cliente"

    fill_in "Cif", with: @cliente.cif
    fill_in "Codigo", with: @cliente.codigo
    fill_in "Direccion", with: @cliente.direccion
    fill_in "Fecha expiracion contrato", with: @cliente.fecha_expiracion_contrato
    fill_in "Fecha inicio contrato", with: @cliente.fecha_inicio_contrato
    fill_in "Municipio", with: @cliente.municipio
    fill_in "Numero reconocimientos", with: @cliente.numero_reconocimientos
    fill_in "Provincia", with: @cliente.provincia
    fill_in "Razon social", with: @cliente.razon_social
    click_on "Create Cliente"

    assert_text "Cliente was successfully created"
    click_on "Back"
  end

  test "should update Cliente" do
    visit cliente_url(@cliente)
    click_on "Edit this cliente", match: :first

    fill_in "Cif", with: @cliente.cif
    fill_in "Codigo", with: @cliente.codigo
    fill_in "Direccion", with: @cliente.direccion
    fill_in "Fecha expiracion contrato", with: @cliente.fecha_expiracion_contrato
    fill_in "Fecha inicio contrato", with: @cliente.fecha_inicio_contrato
    fill_in "Municipio", with: @cliente.municipio
    fill_in "Numero reconocimientos", with: @cliente.numero_reconocimientos
    fill_in "Provincia", with: @cliente.provincia
    fill_in "Razon social", with: @cliente.razon_social
    click_on "Update Cliente"

    assert_text "Cliente was successfully updated"
    click_on "Back"
  end

  test "should destroy Cliente" do
    visit cliente_url(@cliente)
    click_on "Destroy this cliente", match: :first

    assert_text "Cliente was successfully destroyed"
  end
end
