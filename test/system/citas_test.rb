require "application_system_test_case"

class CitasTest < ApplicationSystemTestCase
  setup do
    @cita = citas(:one)
  end

  test "visiting the index" do
    visit citas_url
    assert_selector "h1", text: "Citas"
  end

  test "should create cita" do
    visit citas_url
    click_on "New cita"

    fill_in "Cliente", with: @cita.cliente_id
    fill_in "Estado", with: @cita.estado
    fill_in "Fecha", with: @cita.fecha
    fill_in "Hora inicio", with: @cita.hora_inicio
    fill_in "Numero realizados", with: @cita.numero_realizados
    fill_in "Numero solicitado", with: @cita.numero_solicitado
    click_on "Create Cita"

    assert_text "Cita was successfully created"
    click_on "Back"
  end

  test "should update Cita" do
    visit cita_url(@cita)
    click_on "Edit this cita", match: :first

    fill_in "Cliente", with: @cita.cliente_id
    fill_in "Estado", with: @cita.estado
    fill_in "Fecha", with: @cita.fecha
    fill_in "Hora inicio", with: @cita.hora_inicio.to_s
    fill_in "Numero realizados", with: @cita.numero_realizados
    fill_in "Numero solicitado", with: @cita.numero_solicitado
    click_on "Update Cita"

    assert_text "Cita was successfully updated"
    click_on "Back"
  end

  test "should destroy Cita" do
    visit cita_url(@cita)
    click_on "Destroy this cita", match: :first

    assert_text "Cita was successfully destroyed"
  end
end
